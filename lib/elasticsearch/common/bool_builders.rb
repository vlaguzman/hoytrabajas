module Elasticsearch::Common::BoolBuilders

  COMMON_BOOL_CLAUSES = [:must, :filter, :should, :must_not]

  COMMON_BOOL_CLAUSES_OPTIONES = {
    must: -> { simple_bool_builder },
    filter: -> { filters_builder },
    should: -> { simple_bool_builder },
    must_not: -> { simple_bool_builder }
  }

  def self.call(parameters: {}, clause: COMMON_BOOL_CLAUSES[0])
    default_bool_builder_by_clause(parameters: parameters, clause: clause)
  end

  private

  def self.default_bool_builder_by_clause(parameters: {}, clause: COMMON_BOOL_CLAUSES[0])

    common_bool_builder = simple_bool_builder(parameters: parameters)

    optiones = {
      must: -> { common_bool_builder },
      filter: -> { group_filters_iterator(group_filters: parameters) },
      should: -> { common_bool_builder },
      must_not: -> { common_bool_builder }
    }
    optiones.default = -> { common_bool_builder }
    optiones[clause].()
  end

  def self.simple_bool_builder(parameters: {})
    parameters.map do |filter_key, filter_value|
      { term: { filter_key => filter_value } }
    end
  end

  def self.group_filters_iterator(group_filters: {})
    group_filters.inject([]) do |filters_transform, (filter_key, filter_values)|
      [*filters_transform, nested_builder(filter_key, filter_values)]
    end
  end

  def self.nested_builder(filter_key, filter_values)
    {
      nested: {
        path: filter_key.to_s,
        query: {
          bool: {
            should: filter_values_interator(filter_key, values: filter_values)
          }
        }
      }
    }
  end

  def self.filter_values_interator(filter_key, filter_method: 'id', values: [])

    values = values.is_a?(Array) ? values : [values]

    values.map do |value|
      { match: { "#{filter_key}.#{filter_method}" => value } }
    end
  end

end