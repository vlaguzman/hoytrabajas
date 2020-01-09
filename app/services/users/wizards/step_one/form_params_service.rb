class Users::Wizards::StepOne::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :name,
    :last_name,
    :identification_number,
    :contact_number
  ]

  SELECT_FIELDS_KEYS = [
    :document_type_id,
    :born_country_id,
    :born_state_id,
    :born_city_id,
    :residence_country_id,
    :residence_state_id,
    :residence_city_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :nationality_ids
  ]

  private

  def born_country_id_list
    ListConverter.model_list Country
  end

  def born_state_id_list
    ListConverter.model_list(State, nil, additional_key: :country_id)
  end

  def born_city_id_list
    ListConverter.model_list City
  end

  def residence_country_id_list
    ListConverter.model_list Country
  end

  def residence_state_id_list
    ListConverter.model_list(State, nil, additional_key: :country_id)
  end

  def residence_city_id_list
    ListConverter.model_list City
  end

  def nationality_ids_list
    ListConverter.model_list Nationality
  end

  def document_type_id_list
    ListConverter.model_list DocumentType
  end

  def born_country_id_current_value
    source.born_country.id if source.born_country.present?
  end

  def born_state_id_current_value
    source.born_state.id if source.born_state.present?
  end

  def residence_country_id_current_value
    source.residence_country.id if source.residence_country.present?
  end

  def residence_state_id_current_value
    source.residence_state.id if source.residence_state.present?
  end

end
