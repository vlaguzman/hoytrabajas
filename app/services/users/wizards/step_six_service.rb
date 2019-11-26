module Users::Wizards::StepSixService
  def self.call(curriculum_vitae: _, update_params: {})

    strong_skills_params = update_params.delete(:technical_skills)
    update_strong_params(curriculum_vitae, strong_skills_params: strong_skills_params)
    #TODO Oscar temporal desiable function until create the other fields
    #laguage_params = update_params[:curriculum_vitae].delete(:curriculum_vitaes_languages)
    #update_curriculum_vitae_laguage( laguage_params: laguage_params.merge!(curriculum_vitae_id: curriculum_vitae.id) )

    #to_learn_skill_params = update_params[:curriculum_vitae].delete(:to_learn_skills)
    #create_to_learn_skills(to_learn_skill_params: to_learn_skill_params.merge!(curriculum_vitae_id: cv.id))

    prepared_params = prepare_params(update_params)

    Users::WizardService.update_curriculum_vitae(curriculum_vitae, update_params: prepared_params)[0]
  end

  private

  def self.update_strong_params(curriculum_vitae, strong_skills_params: [])
    curriculum_vitae.strong_skills.destroy_all

    complete_strong_skills = strong_skills_params
      .select {|strong_skill| not strong_skill.value?("") }
      .map { |strong_skill| strong_skill.merge(curriculum_vitae_id: curriculum_vitae.id, step_up: false) }
      .each do |strong_skill|
        CurriculumVitaesTechnicalSkills.create(strong_skill)
      end
  end

  #TODO Oscar temporal desiable function until create the other fields
  #def self.update_curriculum_vitae_laguage(laguage_params: {})
  #  if laguage_params.present?
  #    CurriculumVitaesLanguages.create(laguage_params)
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