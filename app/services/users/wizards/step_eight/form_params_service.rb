class Users::Wizards::StepEight::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :company_name,
    :started_at,
    :finished_at,
    :still_in_progress,
  ]

  SELECT_FIELDS_KEYS = [
    :job_category_id,
    :work_methodology_id,
    :city_id,
    :state_id
  ]

  AUTCOMPLETE_SELECT_FIELDS_KEYS = [
    {key: :technical_skills, multiple: true},
    {key: :work_position, multiple: false}
  ]

  private

  def job_category_id_list
    ListConverter.model_list JobCategory
  end

  def work_position_list
    ListConverter.model_list WorkPosition
  end

  def work_methodology_id_list
    ListConverter.model_list WorkMethodology
  end

  def technical_skills_list
    ListConverter.model_list TechnicalSkill
  end

  def city_id_list
    ListConverter.model_list City
  end

  def state_id_list
    ListConverter.model_list State
  end

  def state_id_current_value
    source.city_state_id
  end
end