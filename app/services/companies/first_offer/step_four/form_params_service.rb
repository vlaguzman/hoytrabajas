class Companies::FirstOffer::StepFour::FormParamsService < BaseFormWizardsService

  SELECT_FIELDS_KEYS = [
    :offer_type_id,
    :work_mode_id,
    :contract_type_id,
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :sex_ids,
    :age_range_list_ids
  ]

  private

  def fields_builder
    super(
      vacancies_quantity_field,
      immediate_start_field,
      close_date_field
    )
  end

  def offer_type_id_list
    ListConverter.model_list OfferType
  end

  def work_mode_id_list
    ListConverter.model_list WorkMode
  end

  def age_range_list_ids_list
    ListConverter.model_list AgeRangeList
  end

  def contract_type_id_list
    ListConverter.model_list ContractType
  end

  def sex_ids_list
    ListConverter.model_list Sex
  end

  def vacancies_quantity_field
    current_value = source && source.vacancies_quantity

    {
      vacancies_quantity: {
        name: 'offer[vacancies_quantity]',
        label: template_translations[:form][:formFields][:vacancies_quantity],
        values: { min: 1, max: 100 },
        step: 1,
        current_value: current_value
      }
    }
  end

  def close_date_field
    object = source && source.close_date
    close_date = object.present? ? "#{object.year}, #{object.month}, #{object.day}" : ""

    {
      close_date: {
        name: 'offer[close_date]',
        label: template_translations[:form][:formFields][:close_date],
        current_value: close_date
      }
    }
  end

  def immediate_start_field
    current_value = source && source.immediate_start
    {
      immediate_start: {
        name: 'offer[immediate_start]',
        label: template_translations[:form][:formFields][:immediate_start],
        description: template_translations[:immediate_start_description],
        current_value: current_value
      }
    }
  end
end
