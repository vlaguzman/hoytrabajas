class Users::Wizards::StepTen::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :title,
    :start_date,
    :entity_name,
    :diploma
  ]

  SELECT_FIELDS_KEYS = [
    :country_id,
    :city_id,
    :state_id
  ]

  private

  def city_id_list
    ListConverter.model_list City
  end

  def country_id_list
    ListConverter.model_list Country
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