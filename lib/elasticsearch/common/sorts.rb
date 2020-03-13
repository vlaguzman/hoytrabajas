class Elasticsearch::Common::Sorts

  ORDER_OPTIONS = [:asc, :desc]
  MODE_OPTIONS = [:min, :max, :sum, :avg, :median]

  SORT_KEYS = []

  def call(sort_parameters: self.class::SORT_KEYS)
    sort_object_builder(sort_parameters: sort_parameters) if sort_parameters.is_a?(Array)
  end

  def sort_object_builder(sort_parameters: [])
    { sort: sort_field_detector(sort_parameters: sort_parameters) }
  end

  def sort_field_detector(sort_parameters: [])
    sort_parameters.map do |parameter|
      parameter.is_a?(Hash) ? sort_field_builder(**parameter) : sort_field_builder(key: parameter)
    end
  end

  def sort_field_builder(key: nil, order: ORDER_OPTIONS[1], mode: nil)
    {
      key => contente_key_builder(order, mode)
    }
  end

  def contente_key_builder(order, mode)
    key_content = Hash.new.tap do |field|
      field[:order] = order
      field[:mode] = mode if mode.present?
    end
  end

end
