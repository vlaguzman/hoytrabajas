module FormProgressManager
  MAX_COMPANY_STEPS = 7
  MAX_USER_STEPS = 11

  def self.calculate_company_progress(current_company_step)
    (100 / MAX_COMPANY_STEPS * current_company_step)
  end

  def self.calculate_user_progress(current_user_step)
    (100 / MAX_USER_STEPS * current_user_step)
  end
end