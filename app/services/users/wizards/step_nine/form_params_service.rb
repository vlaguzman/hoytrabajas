class Users::Wizards::StepNine::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :degree,
    :institution_name,
    :start_date,
    :finish_date,
    :ongoing_study,
    :diploma
  ]

  SELECT_FIELDS_KEYS = [
    :city_id
  ]

  private

  def input_fields_builder
    super('curriculum_vitae', 'educational_level')
  end

  def select_fields_builder
    super('curriculum_vitae', 'educational_level')
  end

  def multiple_select_fields_builder
    super('curriculum_vitae', 'educational_level')
  end

  def city_id_list
    ListConverter.model_list City
  end

end