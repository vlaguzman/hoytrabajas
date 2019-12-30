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
    :city_id,
    :state_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :technical_skills
  ]

  private

  def multiple_select_fields_builder
    Hash[
      self.class::MULTIPLE_SELECT_FIELDS_KEYS.collect { |key| [key, technical_skills_builder(key)] }
    ]
  end

  def technical_skills_builder(key)
    {
      name: name_builder(key, false, []),
      label:labels[key],
      values: self.send("#{key}_list"),
      current_value: source.technical_skills.pluck(:description)
    }
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