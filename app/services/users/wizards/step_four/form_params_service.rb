class Users::Wizards::StepFour::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :travel_disponibility
  ]

  SELECT_FIELDS_KEYS = [
    :country_id,
    :city_id,
    :state_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :driving_licence_ids,
    :vehicle_ids
  ]

  private

  def input_fields_builder
    super('curriculum_vitae')
  end

  def country_id_list
    ListConverter.model_list Country
  end

  def state_id_list
    ListConverter.model_list(State, nil, additional_key: :country_id)
  end

  def city_id_list
    ListConverter.model_list City
  end

  def driving_licence_ids_list
    ListConverter.model_list DrivingLicence
  end

  def vehicle_ids_list
    ListConverter.model_list Vehicle
  end

  def travel_disponibility_current_value
    source.curriculum_vitae.travel_disponibility
  end

  def state_id_current_value
    source.city_state_id
  end

  def country_id_current_value
    source.city_state_country_id
  end
end