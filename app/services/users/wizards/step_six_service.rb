class Users::Wizards::StepSixService
  include AddModelErrors::CurriculumVitaes::TechnicalSkills

  ADD_CV_ERRORS_SERVICE = Users::Wizards::CurriculumVitaeErrorsService

  def initialize(curriculum_vitae)
    self.curriculum_vitae = curriculum_vitae
  end

  def update(update_params)
    execute_update(update_params: update_params)
  end

  attr_accessor :curriculum_vitae

  private

  def execute_update(update_params: {})

    technical_skills_params_list = update_params.delete(:technical_skills) || []
    to_learn_skills_params_list = update_params.delete(:to_learn_skills) || []
    languages_params_lists = update_params.delete(:languages) || []

    self.curriculum_vitae = Users::WizardService.update_curriculum_vitae(
      self.curriculum_vitae,
      update_params: prepare_params(update_params)
    )[0]

    update_strong_params(
      strong_skills_params_list: technical_skills_params_list
    )

    update_to_learn_params(
      to_learn_skills_params_list: to_learn_skills_params_list
    )

    update_languages_params(
      languages_params: languages_params_lists
    )

    self.curriculum_vitae
  end

  def update_strong_params(strong_skills_params_list: [])
    validate_strong_skills(model: self.curriculum_vitae, strong_skills_list: strong_skills_params_list)
    update_skills_params(type_skill: :technical_skills, params_list: strong_skills_params_list)
  end

  def update_to_learn_params(to_learn_skills_params_list: [])
    update_skills_params(type_skill: :to_learn_skills, params_list: to_learn_skills_params_list, step_up: true)
  end

  def update_languages_params(languages_params: [])
    self.curriculum_vitae.strong_languages.destroy_all

    languages_params
      .select {|language| not language.value?("") }
      .map { |language| language.merge(curriculum_vitae_id: self.curriculum_vitae.id) }
      .each do |language|
        CurriculumVitaesLanguages.create(language)
      end
  end

  def update_skills_params(type_skill: nil, params_list: [], step_up: false)

    self.curriculum_vitae.send(type_skill).destroy_all

    params_list
      .reject {|skill_parameters| skill_parameters.value?("") }
      .map { |skill_parameters| persist_technical_skills(skill_parameters) }
      .map { |skill_parameters| add_error_of_technical_skill(skill_parameters, type_skill: type_skill) }
      .select { |skill_parameters| skill_parameters[:technical_skill].present? }
      .map { |valid_skill_parameters| valid_skill_parameters.merge(curriculum_vitae_id: self.curriculum_vitae.id, step_up: step_up) }
      .map { |valid_skill_parameters| persist_group_technical_skill(valid_skill_parameters) }
  end

  def add_error_of_technical_skill(skill_parameters, type_skill: nil)
    skill_parameters.tap { |field|
        technical_skill_valid = field[:technical_skill_description].valid?
        self.curriculum_vitae = ADD_CV_ERRORS_SERVICE.(self.curriculum_vitae, update_params: { type_skill => technical_skill_valid })
        field[:technical_skill] = technical_skill_valid && field[:technical_skill_description]
      }
      .without(:technical_skill_description)
  end

  def persist_group_technical_skill(valid_skill_parameters)
    CurriculumVitaesTechnicalSkills.create(valid_skill_parameters)
  end

  def persist_technical_skills(skill_object)
    skill_object.tap do |field|
      field[:technical_skill_description] = BaseForms::FindOrCreateRecordService.(klass: TechnicalSkill, search_or_cration_params: {description: skill_object[:technical_skill_description]})
    end
  end

  def prepare_params(params)
    params.deep_symbolize_keys.tap do |fields|
      fields[:soft_skill_ids] = prepare_multiple_fileds_ids(fields[:soft_skill_ids])
    end
  end

  def prepare_multiple_fileds_ids(param_key)
    param_key.first.split(",").map(&:to_i)
  end

end
