module ListConverter

  def self.model_list(klass)
    klass.all
    .map { |object| object.attributes.deep_symbolize_keys.slice(:id, :description) }
    .sort_by { |object| object[:description] }
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
