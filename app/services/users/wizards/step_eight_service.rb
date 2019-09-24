module Users::Wizards::StepEightService
  def self.call(candidate: _, update_params: {})
    cv = candidate.curriculum_vitaes.first

    work_experience_params = update_params[:curriculum_vitae].delete(:work_experience)
    work_experience = creat_work_experience(work_experience_params: work_experience_params.merge!(curriculum_vitae_id: cv.id))

    candidate = work_experience_valid(candidate, work_experience)

    Users::WizardService.update_step(candidate, update_params: update_params)
  end

  private

  def self.creat_work_experience(work_experience_params: {})
    if work_experience_params.present?
      WorkExperience.create(work_experience_params)
    end
  end

  def self.work_experience_valid(candidate, work_experience)
    unless(work_experience.valid?)
      candidate.errors.merge! work_experience.errors
    end

    candidate
  end

end