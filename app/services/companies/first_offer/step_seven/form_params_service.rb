class Companies::FirstOffer::StepSeven::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :duration
  ]

  SELECT_FIELDS_KEYS = [
    :city_id,
    :educational_degree_id,
    :duration_type_id,
  ]

  SUBFORMS = [:technical_skills, :languages]

  SUBFORMS_FIELDS = {
    :technical_skills => [:technical_skill_id, :level_id],
    :languages => [:language_id, :level_id]
  }

  private

  def fields_builder
    super(
      required_experience_field,
      subform_object_builder(:offer, :technical_skills),
      subform_object_builder(:offer, :languages)
    )
  end

  def required_experience_field
    {
      required_experience: {
        name: 'offer[required_experience]',
        label: template_translations[:form][:formFields][:required_experience],
        description: template_translations[:required_experience_description],
        current_value: source.required_experience
      }
    }
  end

  def city_id_list
    ListConverter.model_list City
  end

  def educational_degree_id_list
    ListConverter.model_list EducationalDegree
  end

  def duration_current_value
    source.required_experiences_duration
  end

  def duration_type_id_current_value
    source.required_experiences_duration_type_id
  end

  def duration_type_id_list
    ListConverter.model_list DurationType
  end

  def technical_skill_id_list
    ListConverter.model_list TechnicalSkill
  end

  def level_id_list
    ListConverter.model_list Level
  end

  def language_id_list
    ListConverter.model_list Language
  end

end
