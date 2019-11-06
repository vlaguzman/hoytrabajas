module ListConverter

  def self.model_list(klass)
    klass.all.map { |object| object.attributes.deep_symbolize_keys.slice(:id, :description) }
  end

  def self.model_array_list(klass, symbol=:description, order_by: nil)
   begin
     klass.any? ? klass.all.order(order_by).map { |object| [object.send(symbol), object.id] } : []
   rescue Exception => e
     []
   end
  end

end
