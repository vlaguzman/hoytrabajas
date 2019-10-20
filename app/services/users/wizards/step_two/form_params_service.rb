class Users::Wizards::StepTwo::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :about_me,
    :birthday
  ]

  SELECT_FIELDS_KEYS = [
    :sex_id,
    :educational_degree_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :limitation_ids
  ]

  private

  def sex_id_list
    ListConverter.model_list Sex
  end

  def limitation_ids_list
    ListConverter.model_list Limitation
  end

  def educational_degree_id_list
    ListConverter.model_list EducationalDegree
  end

end