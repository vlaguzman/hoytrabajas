config = {
  transport_options: { request: { timeout: 5 } },
  hosts: ["#{ENV['ELASTICSEARCH_SCHEME']}#{ENV['ELASTICSEARCH_USER']}:#{ENV['ELASTICSEARCH_PASSWORD']}@#{ENV['ELASTICSEARCH_HOST']}:#{ENV['ELASTICSEARCH_PORT']}"
]
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)