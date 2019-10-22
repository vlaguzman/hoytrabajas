class Companies::FirstOffer::StepOne::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :name,
    :contact_name,
    :contact_work_position,
    :contact_cellphone
  ]

  SELECT_FIELDS_KEYS = [
    :industry_id,
    :employees_range_id
  ]

  private

  def industry_id_list
    ListConverter.model_list Industry
  end

  def employees_range_id_list
    ListConverter.model_list EmployeesRange
  end

end
