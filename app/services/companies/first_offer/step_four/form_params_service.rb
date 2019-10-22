class Companies::FirstOffer::StepFour::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEY = [
    :close_date,
    :inmediate_start
  ]

  SELECT_FIELDS_KEYS = [
    :contract_type_id,
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :sex_id
  ]

  SLIDER_FIELDS_KEYS = [
    :vacancies_quantity,
    :offer_age_range,
  ]

  private

  def contract_type_id_list
    ListConverter.model_list ContractType
  end

  def sex_id_list
    ListConverter.model_list Sex
  end

  def vacancies_quantity_values
    ListConverter.slider_values 0, 100
  end

  def offer_age_range_values
    ListConverter.slider_values 18, 80
  end

end
