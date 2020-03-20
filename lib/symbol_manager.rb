module SymbolManager

  def self.to_constant(symbol = nil)
    transformed_symbol = symbol.to_s.capitalize.classify
    ActiveSupport::Inflector.safe_constantize(transformed_symbol)
  end

end