class Companies::FirstOffer::StepFour::FormParamsService < BaseFormWizardsService

  SELECT_FIELDS_KEYS = [
    :contract_type_id,
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :sex_ids
  ]

  private

  def fields_builder
    super(
      vacancies_quantity_field,
      offer_age_range_field,
      immediate_start_field,
      close_date_field
    )
  end

  def contract_type_id_list
    ListConverter.model_list ContractType
  end

  def sex_ids_list
    ListConverter.model_list Sex
  end

  def vacancies_quantity_field
    {
      vacancies_quantity: {
        name: 'offer[vacancies_quantity]',
        label: template_translations[:form][:formFields][:vacancies_quantity],
        values: { min: 1, max: 100 },
        step: 1,
        current_value: source.vacancies_quantity
      }
    }
  end

  def offer_age_range_field
    object = AgeRange.find_by(offer_id: source.id)
    current_value = object.present? ? [object.from, object.to] : ""

    {
      offer_age_range: {
        name: 'offer[offer_age_range]',
        label: template_translations[:form][:formFields][:offer_age_range],
        beforeLabel: template_translations[:offer_age_range_before],
        afterLabel: template_translations[:offer_age_range_after],
        values: { min: 18, max: 80 },
        step: 1,
        current_value: current_value
      }
    }
  end

  def close_date_field
    object = source.close_date
    close_date = object.present? ? "#{object.year}, #{object.month}, #{object.day}" : ""

    {
      close_date: {
        name: 'offer[close_date]',
        label: template_translations[:form][:formFields][:close_date],
        dateOptions: {
          format: 'dd MMMM yyyy',
          disableFuture: false,
          emptyLabel: '...'
        },
        current_value: close_date
      }
    }
  end

  def immediate_start_field
    {
      immediate_start: {
        name: 'offer[immediate_start]',
        label: template_translations[:form][:formFields][:immediate_start],
        description: template_translations[:immediate_start_description],
        current_value: source.immediate_start
      }
    }
  end

end
