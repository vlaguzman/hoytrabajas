class Users::Wizards::StepFive::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :from,
    :to
  ]

  SELECT_FIELDS_KEYS = [
    :currency_id,
    :salary_period_id,
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :available_work_day_ids,
    :working_day_ids
  ]

  private

  def curriculum_vitae_multiple_select_fields_builder
    multiple_select_fields_builder('curriculum_vitae')
  end

  def curriculum_vitae_salary_select_fields_builder()
    select_fields_builder('curriculum_vitae', 'curriculum_vitae_salary')
  end

  def input_fields_builder
    super('curriculum_vitae', 'curriculum_vitae_salary')
  end

  def fields_builder
    super(
      curriculum_vitae_salary_select_fields_builder,
      curriculum_vitae_multiple_select_fields_builder,
      range_type_builder
    )
  end

  def currency_id_list
    ListConverter.model_list Currency
  end

  def salary_period_id_list
    ListConverter.model_list SalaryPeriod
  end

  def available_work_day_ids_list
    ListConverter.model_list AvailableWorkDay
  end

  def working_day_ids_list
    ListConverter.model_list WorkingDay
  end

  def range_type_builder
    {range_type: {
      name: 'user[curriculum_vitae][curriculum_vitae_salary][range_type]',
      label: template_translations[:form][:formFields][:range_type],
      values: [{id: 1, description: "Rango"}, {id: 2, description: "Fijo"}]
      }}
  end

end