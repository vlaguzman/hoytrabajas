class Elasticsearch::IndexerWorker
  include Sidekiq::Worker

  sidekiq_options queue: :elasticsearch, retry: false

  def perform(model_type, model_index, operation, record_id)
    Indexer_logger.info [operation, I18n.t("elasticsearch.start_operation", id: record_id)]

    execute_operation(model_type, model_index, operation, record_id)
  end

  private

  Indexer_logger = Logger.new("#{Rails.root}/log/elasticsearch_indexer_worker.log")
  Client = Elasticsearch::Client.new host: "#{ENV['ELASTICSEARCH_URL']}" , logger: Indexer_logger

  def execute_operation(model_type, model_index, operation, record_id)

    options = {
      :index => -> { handle_index_operation(model_type, model_index, operation, record_id) },
      :delete => -> { handle_delete_operation(model_type, model_index, record_id) },
    }

    options.default = -> { handle_index_operation(model_type, model_index, operation, record_id) }

    options[operation.to_sym].()
  end

  def handle_index_operation(model_type, model_index, operation, record_id)
    record = SymbolManager.to_constant(model_type).find_by(id: record_id)
    record && Client.index(index: model_index, type: model_type, id: record.id, body: record.__elasticsearch__.as_indexed_json)

    logger.info I18n.t("elasticsearch.indexing_success", id: record_id, model: model_type)

  end

  def handle_delete_operation(model_type, model_index, record_id)
    begin
      Client.delete index: model_index, type: model_type, id: record_id
    rescue Elasticsearch::Transport::Transport::Errors::NotFound
      logger.error I18n.t("elasticsearch.record_no_found", id: record_id, model: model_type)
    end
  end

end

#Elasticsearch::IndexerWorker.perform_async('offer', 'doc', 'index', 36676)

#Elasticsearch::IndexerWorker.new.perform('offer', 'doc', 'index', 36676)
