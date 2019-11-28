module Users::Wizards::StepSixService
  def self.call(curriculum_vitae: _, update_params: {})

    strong_skills_params = update_params.delete(:technical_skills)
    update_strong_params(curriculum_vitae, strong_skills_params: strong_skills_params)

    to_learn_skills_params = update_params.delete(:to_learn_skills)
    update_to_learn_params(curriculum_vitae, to_learn_skills_params: to_learn_skills_params)

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
    update_skills_params(curriculum_vitae, params: strong_skills_params)
  end

  def self.update_to_learn_params(curriculum_vitae, to_learn_skills_params: [])
    update_skills_params(curriculum_vitae, type_skill: :to_learn_skills, params: to_learn_skills_params, step_up: true)
  end

  def self.update_skills_params(curriculum_vitae, type_skill: :strong_skills, params: [], step_up: false)
    curriculum_vitae.send(type_skill).destroy_all

    params
      .select {|skill| not skill.value?("") }
      .map { |skill| skill.merge(curriculum_vitae_id: curriculum_vitae.id, step_up: step_up) }
      .each do |skill|
        CurriculumVitaesTechnicalSkills.create(skill)
      end
  end

  #TODO Oscar temporal desiable function until create the other fields
  #def self.update_curriculum_vitae_laguage(laguage_params: {})
  #  if laguage_params.present?
  #    CurriculumVitaesLanguages.create(laguage_params)
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