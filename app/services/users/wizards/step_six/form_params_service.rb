class Users::Wizards::StepSix::FormParamsService < BaseFormWizardsService

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :soft_skill_ids
  ]

  SUBFORMS = [:technical_skills, :to_learn_skills]

  SUBFORMS_FIELDS = {
    :technical_skills => [:job_category_id, :technical_skill_id, :level_id],
    :to_learn_skills => [:job_category_id, :technical_skill_id]
  }

  private

  def fields_builder
    super(
      skills_builder(:technical_skills),
      skills_builder(:to_learn_skills)
    )
  end

  def skills_builder(skills_type)
    {
      skills_type => {
        name:        skills_type,
        form_keys:   [:curriculum_vitae, skills_type],
        field_keys:  SUBFORMS_FIELDS[skills_type],
        main_label:  template_translations[:sub_forms][skills_type],
        list_values: Hash[
          SUBFORMS_FIELDS[skills_type].collect { |field| [field, self.send("#{field}_list")] }
        ],
        current_values: current_values_of(skills_type).()
      }
    }
  end

  def current_values_of(skills_type)
    call_of_skills = skills_type.eql?(:technical_skills) ? :strong_skills : skills_type
    source.present? ? -> { ListConverter.parameters_list(source.send(call_of_skills), SUBFORMS_FIELDS[skills_type])} : -> { [] }
  end

  def soft_skill_ids_list
    ListConverter.model_list SoftSkill
  end

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