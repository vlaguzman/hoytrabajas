module Users::WizardService

  def self.update_step(candidate, update_params: {})

    curriculum = candidate.curriculum_vitae

    verify_presence_curriculum(curriculum, update_params: update_params)

    update_params.except!(:curriculum_vitae)

    verify_presence_candidate(candidate, update_params: update_params)

    candidate
  end

  def self.update_curriculum_vitae(curriculum, update_params: {})

    first_valid = curriculum.update(
      HashesConverter.sanitize_array_values(hash: update_params)
    )

    validate_curriculum = Users::Wizards::CurriculumVitaeErrorsService.(curriculum, update_params: update_params)

    [validate_curriculum, first_valid && validate_curriculum.errors.empty?]
  end

  private

  def self.update_candidate(candidate, update_params: {})

    first_valid = candidate.update(
      HashesConverter.sanitize_array_values(hash: update_params)
    )

    validate_candidate = Users::Wizards::UserErrorsService.(candidate, update_params: update_params)

    [validate_candidate, first_valid && validate_candidate.errors.empty?]
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
