class Users::Wizards::StepEight::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :company_name,
    :started_at,
    :finished_at,
    :still_in_progress,
  ]

  SELECT_FIELDS_KEYS = [
    :job_category_id,
    :work_position_id,
    :work_methodology_id,
    :city_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :technical_skill_ids
  ]

  private

  def input_fields_builder
    super('curriculum_vitae', 'work_experience')
  end

  def select_fields_builder
    super('curriculum_vitae', 'work_experience')
  end

  def multiple_select_fields_builder
    super('curriculum_vitae', 'work_experience')
  end

  def buttons_translation
    buttons = template_translations[:form][:buttons]
      .merge(previousPath: previous_path)
      .merge(nextPath: next_path)
      .tap { |object| object.merge!(addOther: object.delete(:add_other) ) } if template_translations.present?
  end

  def job_category_id_list
    ListConverter.model_list JobCategory
  end

  def work_position_id_list
    ListConverter.model_list WorkPosition
  end

  def work_methodology_id_list
    ListConverter.model_list WorkMethodology
  end

  def technical_skill_ids_list
    ListConverter.model_list TechnicalSkill
  end

  def city_id_list
    ListConverter.model_list City
  end

end