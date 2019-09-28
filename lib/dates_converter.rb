module DatesConverter
  def self.default(date: Date.today)
    I18n.l(date, format: '%d de %B del %Y')
  end
end