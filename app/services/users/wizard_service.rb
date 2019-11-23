module Users::WizardService

  def self.update_step(candidate, update_params: {})

    curriculum = candidate.curriculum_vitae

    verify_presence_curriculum(curriculum, update_params: update_params)

    update_params.except!(:curriculum_vitae)

    verify_presence_candidate(candidate, update_params: update_params)

    candidate

  end

  def self.update_curriculum_vitae(curriculum, update_params: {})
    [curriculum, curriculum.update(update_params)]
  end

  private

  def self.update_candidate(candidate, update_params: {})
    [candidate, candidate.update(update_params)]
  end


  def self.verify_presence_candidate(candidate, update_params: {})
    if candidate.present? && update_params.present?
      update_candidate(candidate, update_params: update_params)
    end
  end

  def self.verify_presence_curriculum(curriculum, update_params: {})
    if curriculum.present? && update_params[:curriculum_vitae].present?
      update_curriculum_vitae(curriculum, update_params: update_params[:curriculum_vitae])
    end
  end

end