module Users::Wizards::StepSixService
  def self.call(curriculum_vitae: _, update_params: {})

    #TODO Oscar temporal desiable function until create the other fields
    #laguage_params = update_params[:curriculum_vitae].delete(:curriculum_vitaes_languages)
    #update_curriculum_vitae_laguage( laguage_params: laguage_params.merge!(curriculum_vitae_id: curriculum_vitae.id) )

    #technical_skill_params = update_params[:curriculum_vitae].delete(:curriculum_vitaes_technical_skills)
    #create_curriculum_vitae_technical_skill(technical_skill_params: technical_skill_params.merge!(curriculum_vitae_id: cv.id))

    #to_learn_skill_params = update_params[:curriculum_vitae].delete(:to_learn_skills)
    #create_to_learn_skills(to_learn_skill_params: to_learn_skill_params.merge!(curriculum_vitae_id: cv.id))

    prepared_params = prepare_params(update_params)

    Users::WizardService.update_curriculum_vitae(curriculum_vitae, update_params: prepared_params)[0]
  end

  private

  #TODO Oscar temporal desiable function until create the other fields
  #def self.update_curriculum_vitae_laguage(laguage_params: {})
  #  if laguage_params.present?
  #    CurriculumVitaesLanguages.create(laguage_params)
  #  end
  #end

  #def self.create_curriculum_vitae_technical_skill(technical_skill_params: {})
  #  if technical_skill_params.present?
  #    CurriculumVitaesTechnicalSkills.create(technical_skill_params.merge!(step_up: :false))
  #  end
  #end

  #def self.create_to_learn_skills(to_learn_skill_params: {})
  #  if to_learn_skill_params.present?
  #    CurriculumVitaesTechnicalSkills.create(to_learn_skill_params.merge!(step_up: true))
  #  end
  #end

  def self.prepare_params(params)
    params.deep_symbolize_keys.tap do |fields|
      fields[:soft_skill_ids] = prepare_multiple_fileds_ids(fields[:soft_skill_ids])
    end
  end

  def self.prepare_multiple_fileds_ids(param_key)
    param_key.first.split(",").map(&:to_i)
  end

end