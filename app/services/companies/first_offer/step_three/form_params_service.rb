class Companies::FirstOffer::StepThree::FormParamsService < BaseFormWizardsService

  INPUT_FIELDS_KEYS = [
    :title
  ]

  SELECT_FIELDS_KEYS = [
    :job_categories,
    :offers_work_positions,
    :offer_type_id,
    :work_mode_id
  ]

  private

  def job_categories_list
    ListConverter.model_list JobCategory
  end

  def offers_work_positions_list
    ListConverter.model_list WorkPosition
  end

  def offer_type_id_list
    ListConverter.model_list OfferType
  end

  def work_mode_id_list
    ListConverter.model_list WorkMode
  end

  def offers_work_positions_current_value
    object = OffersWorkPositions.find_by(offer_id: source.id)
    object.present? ? object.work_position_id : ""
  end

end
