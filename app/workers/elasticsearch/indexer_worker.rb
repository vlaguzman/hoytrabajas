class Elasticsearch::IndexerWorker
  include Sidekiq::Worker

  sidekiq_options queue: :elasticsearch, retry: false

  def perform(model_key, record_id, operation)
    Elasticsearch::IndexerService.(model_key, record_id, operation: operation)
  end

end