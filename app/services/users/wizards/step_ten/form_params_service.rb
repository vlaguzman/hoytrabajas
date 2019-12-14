class Users::Wizards::StepTen::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :title,
    :start_date,
    :entity_name,
    :diploma
  ]

  SELECT_FIELDS_KEYS = [
    :city_id
  ]

  private

  def city_id_list
    ListConverter.model_list City
  end

end