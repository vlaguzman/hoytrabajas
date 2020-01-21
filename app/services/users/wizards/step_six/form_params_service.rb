class Users::Wizards::StepSix::FormParamsService < BaseFormWizardsService

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :soft_skill_ids
  ]

  SUBFORMS = [:technical_skills, :to_learn_skills, :languages]

  SUBFORMS_FIELDS = {
    :technical_skills => [:job_category_id, :technical_skill_description, :level_id],
    :to_learn_skills => [:job_category_id, :technical_skill_description],
    :languages => [:language_id, :level_id]
  }

  private

  def fields_builder
    super(
      subform_object_builder(:curriculum_vitae, :technical_skills),
      subform_object_builder(:curriculum_vitae, :to_learn_skills),
      subform_object_builder(:curriculum_vitae, :languages)
    )
  end

  def soft_skill_ids_list
    ListConverter.model_list SoftSkill
  end

  def job_category_id_list
    ListConverter.model_list JobCategory
  end

  def technical_skill_description_list
    ListConverter.model_list TechnicalSkill
  end

  def level_id_list
    ListConverter.model_list Level
  end

  def language_id_list
    ListConverter.model_list Language
  end

end
