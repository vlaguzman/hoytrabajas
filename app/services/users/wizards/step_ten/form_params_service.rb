class Users::Wizards::StepTen::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :title,
    :start_date,
    :entity_name,
    :diploma
  ]

  private

  def buttons_translation
    buttons = template_translations[:form][:buttons]
      .merge(previousPath: previous_path)
      .merge(nextPath: next_path)
      .tap { |object| object.merge!(addOther: object.delete(:add_other) ) } if template_translations.present?
  end

  def input_fields_builder
    super('curriculum_vitae', 'acknowledgment')
  end

  def select_fields_builder
    super('curriculum_vitae', 'acknowledgment')
  end

  def multiple_select_fields_builder
    super('curriculum_vitae', 'acknowledgment')
  end

  def city_id_list
    ListConverter.model_list City
  end

end