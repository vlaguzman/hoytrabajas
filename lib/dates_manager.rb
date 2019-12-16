module DatesManager
  def self.default(date: Date.today)
    I18n.l(date, format: '%d de %B del %Y')
  end

  def self.calculate_difference_time(finished_at=Date.today, started_at=Date.today)
    diff = (finished_at - started_at)

    if diff > 365
      calculate_time(diff, 365, I18n.t('date.years'))
    elsif diff > 30
      calculate_time(diff, 30, I18n.t('date.months'))
    elsif diff > 1
      calculate_time(diff,1, I18n.t('date.days'))
    else
      calculate_time(diff)
    end
  end

  def self.calculate_time(diff, div=1, pred=I18n.t('date.today'))
    value = (diff.to_i / div).round(1)
    value > 0 ? "#{value} #{pred}": "#{pred}"
  end
end
