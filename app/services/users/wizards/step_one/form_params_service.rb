class Users::Wizards::StepOne::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEY = [
    :name,
    :last_name,
    :identification_number,
    :contact_number
  ]

  SELECT_FIELDS_KEYS = [
    :document_type_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :nationality_ids
  ]

  private

  def nationality_ids_list
    ListConverter.model_list Nationality
  end

  def document_type_id_list
    ListConverter.model_list DocumentType
  end

end