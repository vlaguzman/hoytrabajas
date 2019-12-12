module DatesManager
  def self.default(date: Date.today)
    I18n.l(date, format: '%d de %B del %Y')
  end

  def self.calculate_difference_time(finished_at, started_at)
    diff = (finished_at - started_at).to_f

    if diff > 365
      calculate_time(diff, 365, "year(s)")
    elsif diff > 30
      calculate_time(diff, 30, "month(s)")
    else
      "#{diff.to_i} day(s)"
    end
  end

  def self.calculate_time(diff, div, pred)
    value = (diff / div).round(1)
    "#{value} #{pred}"
  end
end
