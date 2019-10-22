module ListConverter

  def self.model_list(klass)
    klass.all.map { |object| object.attributes.deep_symbolize_keys.slice(:id, :description) }
  end

  def self.model_array_list(klass, symbol=:description)
    klass.any? ? klass.all.map { |object| [object.send(symbol), object.id] } : []
  end

end
