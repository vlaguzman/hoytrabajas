module Users::Wizards::StepEightService
  def self.call(work_experience: _, update_params: {})
    persit_work_experience(work_experience, params: update_params)
  end

  private

  def self.persit_work_experience(work_experience, params: {})
    [ work_experience, work_experience.update(params) ]
  end

end