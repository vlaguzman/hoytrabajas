module ListConverter

  def self.model_list(klass)
    klass.all.map {|object| object.attributes.deep_symbolize_keys.slice(:id, :description) }
  end

end