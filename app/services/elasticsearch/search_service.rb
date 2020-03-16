module Elasticsearch::SearchService

  ELASTICSEARCH_SCROLL_TIME = '30s'
  ELASTICSEARCH_MAX_QUERY_SIZE = 10000

  def self.call(model, query_class, query_type: Elasticsearch::Common::Queries::QUERY_TYPES[2], sort_class: nil, request_parameters: {}, options: {})
    query = query_manager(query_class, query_type: query_type, request_parameters: request_parameters, sort_class: sort_class)

    options = options[:size].present? ? options : options.merge(size: ELASTICSEARCH_MAX_QUERY_SIZE)

    client = model.__elasticsearch__.client
    model_index = model.index_name

    scroll_request(client: client, model_index: model_index, query: query)
      .map { |result| remove_metadata(result) }

  end

  private

  def self.query_manager(query_class, query_type: nil, request_parameters: {}, sort_class: nil)
    query_base = query_class.new.(query_type: query_type, request_parameters: request_parameters)

    request_builder(query_base, sort_class)
  end

  def self.request_builder(query, sort_class)
    request = Hash.new.merge(query)
    sort_class.present? ? request.merge(sort_class.new.()) : request
  end

  def self.scroll_request(client: nil, model_index: nil, query: {} )
    scroll_result = client.search(index: model_index, scroll: ELASTICSEARCH_SCROLL_TIME, body: query )

    scroll_iterator(client: client, iteration: [*scroll_result['hits']['hits']], scroll_id: scroll_result['_scroll_id'])
  end

  def self.scroll_iterator(client: nil, iteration: [], scroll_id: nil);

    scroll_body = { scroll_id: scroll_id, scroll: ELASTICSEARCH_SCROLL_TIME }

    scroll = client.scroll(body: scroll_body)

    scroll_results = scroll['hits']['hits']

    iteration = [*iteration, *scroll_results]

    scroll_results.any? ? scroll_iterator(client: client, iteration: iteration, scroll_id: scroll['_scroll_id']) : iteration
  end

  def self.remove_metadata(result)
    result['_source'].deep_symbolize_keys
  end

end