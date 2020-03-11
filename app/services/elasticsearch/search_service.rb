module Elasticsearch::SearchService

  ELASTICSEARCH_SCROLL_TIME = '30s'

  def self.call(model, query_class, query_type: Elasticsearch::Common::Queries::QUERY_TYPES[2], sort_class: nil, request_parameters: {}, options: {})
    query = query_manager(query_class, query_type: query_type, request_parameters: request_parameters, sort_class: sort_class)

    options = options[:size].present? ? options : options.merge(size: 10000)

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
    sort_class.present? ?  request.merge(sort_class.new.()) : body
  end

  def self.scroll_request(client: nil, model_index: nil, query: {} )
    scroll_result = client.search(index: model_index, scroll: ELASTICSEARCH_SCROLL_TIME, body: query )

    scroll_iterator(client: client, iteration: [*scroll_result['hits']['hits']], scroll_id: scroll_result['_scroll_id'])
  end

  def self.scroll_iterator(client: nil, iteration: [], scroll_id: nil);

    scroll_body = { scroll_id: scroll_id, scroll: ELASTICSEARCH_SCROLL_TIME }

    scroll_result = client.scroll(body: scroll_body)

    iteration = [*iteration, *scroll_result['hits']['hits']]

    if scroll_result['hits']['hits'].any?
      scroll_iterator(client: client, iteration: iteration, scroll_id: scroll_result['_scroll_id'])
    else
      iteration
    end
  end

  def self.remove_metadata(result)
    result['_source'].deep_symbolize_keys
  end

end