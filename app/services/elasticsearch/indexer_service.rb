module Elasticsearch::IndexerService

  ELASTICSEARCH_OPERATIONS = ['index', 'delete']

  def self.call(model_key, record_id, operation: OPERATIONS[0])
    Indexer_logger.info [operation, I18n.t("elasticsearch.start_operation", id: record_id)]

    execute_operation(model_key, record_id, operation: operation)
  end

  private

  Indexer_logger = Logger.new("#{Rails.root}/log/elasticsearch_indexer_worker.log")

  def self.execute_operation(model_key, record_id, operation: OPERATIONS[0])
    model = SymbolManager.to_constant(model_key)
    type = model.document_type
    options = {
      :index => -> { handle_index_operation(model, record_id, type) },
      :delete => -> { handle_delete_operation(model, record_id, type) },
    }

    options.default = -> { handle_index_operation(model, record_id) }

    options[operation.to_sym].()
  end

  def self.handle_index_operation(model, record_id, type)
    record = model.find_by(id: record_id)

    record && model.__elasticsearch__.client.index(
      index: model.index_name,
      type: type,
      id: record.id,
      body: record.__elasticsearch__.as_indexed_json
    )

    Indexer_logger.info I18n.t("elasticsearch.indexing_success", id: record_id, model: type )
  end


  def self.handle_delete_operation(model, record_id, type)
    begin
      model.__elasticsearch__.client.delete index: model.index_name, type: type, id: record_id
    rescue Elasticsearch::Transport::Transport::Errors::NotFound

      MailNotifier.general_notification(
        :elasticsearch_index_not_found,
        date: Time.now,
        record_id: record_id,
        index_type: type,
      ).deliver

      Indexer_logger.error I18n.t("elasticsearch.record_no_found", id: record_id, model: type )
    end
  end
end


