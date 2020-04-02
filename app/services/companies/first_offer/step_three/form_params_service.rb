class Companies::FirstOffer::StepThree::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :title,
    :description,
    :job_category_image
  ]

  SELECT_FIELDS_KEYS = [
    :job_category_ids,
    :offers_work_positions
  ]

  private

  def fields_builder
    super(confidential_field)
  end

  def confidential_field
    {
      confidential: {
        name: 'offer[confidential]',
        label: template_translations[:form][:formFields][:confidential],
        tooltip: template_translations[:confidential_tooltip],
        current_value: confidential_current_value
      }
    }
  end

  def confidential_current_value
    source.present? ? source.confidential : ''
  end

  def job_category_ids_list
    ListConverter.model_list JobCategory
  end

  def offers_work_positions_list
    ListConverter.model_list WorkPosition
  end

  def offers_work_positions_current_value
    object = OffersWorkPositions.find_by(offer_id: source.id)
    object.present? ? object.work_position_id : ""
  end

end
