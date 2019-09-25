module Users::Wizards::StepSixService
  def self.call(candidate: _, update_params: {})
    cv = candidate.curriculum_vitaes.first

    laguage_params = update_params[:curriculum_vitae].delete(:curriculum_vitaes_languages)
    create_curriculum_vitae_laguage( laguage_params: laguage_params.merge!(curriculum_vitae_id: cv.id) )

    technical_skill_params = update_params[:curriculum_vitae].delete(:curriculum_vitaes_technical_skills)
    create_curriculum_vitae_technical_skill(technical_skill_params: technical_skill_params.merge!(curriculum_vitae_id: cv.id))

    to_learn_skill_params = update_params[:curriculum_vitae].delete(:to_learn_skills)
    create_to_learn_skills(to_learn_skill_params: to_learn_skill_params.merge!(curriculum_vitae_id: cv.id))

    Users::WizardService.update_step(candidate, update_params: update_params)
  end

  private

  def self.create_curriculum_vitae_laguage(laguage_params: {})
    if laguage_params.present?
      CurriculumVitaesLanguages.create(laguage_params)
    end
  end

  def self.create_curriculum_vitae_technical_skill(technical_skill_params: {})
    if technical_skill_params.present?
      CurriculumVitaesTechnicalSkills.create(technical_skill_params.merge!(step_up: :false))
    end
  end

  def self.create_to_learn_skills(to_learn_skill_params: {})
    if to_learn_skill_params.present?
      CurriculumVitaesTechnicalSkills.create(to_learn_skill_params.merge!(step_up: true))
    end
  end

  def self.create_soft_skills(curriculum: _, curriculum_params: {})
    if soft_skill_ids.present?
      curriculum.update(curriculum_params)
    end
  end

end