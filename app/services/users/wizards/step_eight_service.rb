module Users::Wizards::StepEightService
  def self.call(source: _, update_params: {})
    persist_work_experience(source, params: update_params)
  end

  private

  def self.persist_work_experience(work_experience, params: {})
    [ work_experience, work_experience.update(params) ]
  end

end