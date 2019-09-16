module Users::Wizards::StepSixService
  def self.call(candidate: _, update_params: {})
    cv = candidate.curriculum_vitaes.first

    laguage_params = update_params[:curriculum_vitae].delete(:curriculum_vitaes_languages)
    create_curriculum_vitae_laguage( laguage_params: laguage_params.merge!(curriculum_vitae_id: cv.id) )

    technical_skill_params = update_params[:curriculum_vitae].delete(:curriculum_vitaes_technical_skills)
    create_curriculum_vitae_technical_skill(technical_skill_params: technical_skill_params.merge!(curriculum_vitae_id: cv.id))
    #create_salary_params = update_params[:curriculum_vitae].delete(:curriculum_vitae_salary)

    #create_salary_params.merge!(curriculum_vitae: candidate.curriculum_vitaes.first)
    #create_curriculum_vitae_salary(create_params: create_salary_params)

    #Users::WizardService.update_step(candidate, update_params: update_params)
    candidate
  end

  private

  def self.create_curriculum_vitae_laguage(laguage_params: {})
    if laguage_params.present?
      CurriculumVitaesLanguages.create(laguage_params)
    end
  end

  def self.create_curriculum_vitae_technical_skill(technical_skill_params: {})
    if technical_skill_params.present?
      pp technical_skill_params
      x = CurriculumVitaesTechnicalSkills.create(echnical_skill_params.merge!(step_up: true))
      pp x.errors.details
    end
  end

  def self.create_soft_skills(curriculum: _, curriculum_params: {})
    if soft_skill_ids.present?
      curriculum.update(curriculum_params)
    end
  end

end