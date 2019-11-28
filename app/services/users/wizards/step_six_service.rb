module Users::Wizards::StepSixService
  def self.call(curriculum_vitae: _, update_params: {})

    strong_skills_params = update_params.delete(:technical_skills)
    update_strong_params(curriculum_vitae, strong_skills_params: strong_skills_params)

    to_learn_skills_params = update_params.delete(:to_learn_skills)
    update_to_learn_params(curriculum_vitae, to_learn_skills_params: to_learn_skills_params)

    languages_params = update_params.delete(:languages)
    update_languages_params(curriculum_vitae, languages_params: languages_params)

    prepared_params = prepare_params(update_params)
    Users::WizardService.update_curriculum_vitae(curriculum_vitae, update_params: prepared_params)[0]
  end

  private

  def self.update_strong_params(curriculum_vitae, strong_skills_params: [])
    update_skills_params(curriculum_vitae, type_skill: :technical_skills, params: strong_skills_params, step_up: false)
  end

  def self.update_to_learn_params(curriculum_vitae, to_learn_skills_params: [])
    update_skills_params(curriculum_vitae, type_skill: :to_learn_skills, params: to_learn_skills_params, step_up: true)
  end

  def self.update_languages_params(curriculum_vitae, languages_params: [])
    curriculum_vitae.languages.destroy_all

    languages_params
      .select {|language| not language.value?("") }
      .map { |language| language.merge(curriculum_vitae_id: curriculum_vitae.id) }
      .each do |language|
        CurriculumVitaesLanguages.create(language)
      end
  end

  def self.update_skills_params(curriculum_vitae, **update_params)
    #type_skill: :strong_skills, params: [], step_up: false
    curriculum_vitae.send(update_params[:type_skill]).destroy_all

    update_params[:params]
      .select {|skill| not skill.value?("") }
      .map { |skill| skill.merge(curriculum_vitae_id: curriculum_vitae.id, step_up: update_params[:step_up]) }
      .each do |skill|
        CurriculumVitaesTechnicalSkills.create(skill)
      end
  end

  def self.prepare_params(params)
    params.deep_symbolize_keys.tap do |fields|
      fields[:soft_skill_ids] = prepare_multiple_fileds_ids(fields[:soft_skill_ids])
    end
  end

  def self.prepare_multiple_fileds_ids(param_key)
    param_key.first.split(",").map(&:to_i)
  end

end