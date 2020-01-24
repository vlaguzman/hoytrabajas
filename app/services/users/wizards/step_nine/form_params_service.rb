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
    :country_id,
    :city_id,
    :state_id
  ]

  private

  def country_id_list
    ListConverter.model_list Country
  end

  def city_id_list
    ListConverter.model_list City
  end

  def state_id_list
    ListConverter.model_list(State, nil, additional_key: :country_id)
  end

  def state_id_current_value
    source.city_state_id
  end

  def country_id_current_value
    source.city_state_country_id
  end

end