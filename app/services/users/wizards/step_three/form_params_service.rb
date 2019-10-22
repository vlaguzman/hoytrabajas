class Users::Wizards::StepThree::FormParamsService < BaseFormWizardsService

  SELECT_FIELDS_KEYS = [
    :contract_type_id,
    :labor_disponibility_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :job_category_ids,
    :offer_type_ids,
    :work_mode_ids
  ]

  private

  def select_fields_builder
    super("curriculum_vitae")
  end

  def multiple_select_fields_builder
    super("curriculum_vitae")
  end

  def contract_type_id_list
    ListConverter.model_list ContractType
  end

  def labor_disponibility_id_list
    ListConverter.model_list LaborDisponibility
  end

  def job_category_ids_list
    ListConverter.model_list JobCategory
  end

  def offer_type_ids_list
    ListConverter.model_list OfferType
  end

  def work_mode_ids_list
    ListConverter.model_list WorkMode
  end

end