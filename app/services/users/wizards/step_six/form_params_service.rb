class Users::Wizards::StepSix::FormParamsService < BaseFormWizardsService

  SELECT_FIELDS_KEYS = [
    #TODO Oscar Temporal comment while complete the other fields
    #:job_category_id,
    #:technical_skill_id,
    #:level_id,
    #:language_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :soft_skill_ids
  ]

  private

  def soft_skill_ids_list
    ListConverter.model_list SoftSkill
  end

  def fields_builder
    super(technical_skills_builder)
  end

  def technical_skills_builder
    {
      technical_skills:{
        name:       :technical_skills,
        form_keys:  [:curriculum_vitae, :technical_skills],
        field_keys: [:job_category_id, :technical_skill_id, :level_id],
        main_label: template_translations[:sub_forms][:technical_skils],
        list_values: {
          job_category_id:    job_category_id_list,
          technical_skill_id: technical_skill_id_list,
          level_id:           level_id_list
        },
        current_values: sub_forms_current_values_builder(:technical_skills)
      }
    }
  end

  def sub_forms_current_values_builder(sub_form_key)
    response = {
      :technical_skills => technical_skills_current_values
    }


    response.default = -> { [] }
    response[sub_form_key].()
  end

  def technical_skills_current_values
     source.present? ? -> { ListConverter.parameters_list(source.strong_skills, [:job_category_id, :technical_skill_id, :level_id]) } : -> { [] }
  end

  #TODO Oscar Expected technical skills
  #technical_skills:{
  #  name: 'technical_skills',
  #  form_keys: ['curriculum_vitae', 'tecnical_sills'],
  #  field_keys: ['job_category_id', 'technical_skill_id', 'level_id'],
  #  main_label: 'Define técnicas de acuerdo a tu perfil*',
  #  list_values: {
  #    job_category_id: job_category_id_list,
  #    technical_skill_id: technical_skill_id_list,
  #    level_id: level_id_list
  #  },
  #  current_values: []
  #}

  def job_category_id_list
    ListConverter.model_list JobCategory
  end

  def technical_skill_id_list
    ListConverter.model_list TechnicalSkill
  end

  def level_id_list
    ListConverter.model_list Level
  end

  #TODO Oscar Temporal comment while complete the other fields
  #def language_id_list
  #  ListConverter.model_list Language
  #end

end