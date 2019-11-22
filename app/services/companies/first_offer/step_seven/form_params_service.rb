class Companies::FirstOffer::StepSeven::FormParamsService < BaseFormWizardsService

  SELECT_FIELDS_KEYS = [
    :city_id,
    :educational_degree_id,
    :duration,
    :duration_type_id,
    :required_experience,
    :technical_skills_id,
    :technical_skills_level_id,
    :language_id,
    :language_level_id
  ]

  private

  def fields_builder
    super(required_experience_field)
  end

  def city_id_list
    ListConverter.model_list City
  end

  def educational_degree_id_list
    ListConverter.model_list EducationalDegree
  end

  def duration_type_id_list
    ListConverter.model_list DurationType
  end

  def technical_skills_id_list
    ListConverter.model_list TechnicalSkill
  end

  def technical_skills_level_id_list
    ListConverter.model_list Level
  end

  def language_id_list
    ListConverter.model_list Language
  end

  def language_level_id_list
    ListConverter.model_list Level
  end
   def required_experience_field
     {
       required_experience: {
         name: 'offer[required_experience]',
         label: template_translations[:form][:formFields][:required_experience],
         current_value: source.required_experience
       }
     }
   end

end
