class Users::Wizards::StepTen::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :title,
    :start_date,
    :entity_name,
    :diploma
  ]

  private

  def input_fields_builder
    super('curriculum_vitae', 'acknowledgment')
  end

  def select_fields_builder
    super('curriculum_vitae', 'acknowledgment')
  end

  def multiple_select_fields_builder
    super('curriculum_vitae', 'acknowledgment')
  end

end