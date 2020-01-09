module ListConverter

  def self.model_list(klass, sort = :sort, additional_key: nil)
    model_list = klass.all.map { |object| object.attributes.deep_symbolize_keys.slice(:id, :description, :state_id, additional_key) }

    sort.eql?(:no_sort) ? model_list : model_list.sort_by { |object| object[:description] }
  end

  def self.model_array_list(klass, symbol=:description, order_by: nil)
    begin
      klass.any? ? klass.all.order(order_by).map { |object| [object.send(symbol), object.id] } : []
    rescue Exception => error
      []
    end
  end

  def self.parameters_list(array_objects=[], parameters=[])
    array_objects.map do |object|
      Hash[parameters.map do |parameter|
        [parameter, object.send(parameter)]
      end]
    end
  end

end
