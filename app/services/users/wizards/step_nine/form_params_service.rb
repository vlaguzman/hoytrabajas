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
    :city_id,
    :state_id
  ]

  private

  def city_id_list
    ListConverter.model_list City
  end

  def state_id_list
    ListConverter.model_list State
  end

  def state_id_current_value
    source.city_state_id
  end

end