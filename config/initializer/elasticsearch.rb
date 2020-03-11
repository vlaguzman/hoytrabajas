config = {
  transport_options: { request: { timeout: 5 } },
  host: "#{ENV[ELASTICSEARCH_HOST]}:#{ENV[ELASTICSEARCH_PORT]}"
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)