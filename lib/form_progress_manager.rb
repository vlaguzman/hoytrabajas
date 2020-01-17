module FormProgressManager
  def self.calculate_company_progress(step)
    (100 / 7 * step)
  end

  def self.calculate_user_progress(step)
    (100 / 11 * step)
  end
end