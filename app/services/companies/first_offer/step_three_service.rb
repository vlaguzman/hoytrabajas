module Companies::FirstOffer::StepThreeService

  def self.call(company: _, params: {})
    work_position_id = params.delete(:offers_work_positions)
    params.merge!({company_id: company.id})

    params[:id].present? ? update_offer(params, work_position_id) : create_offer(params, work_position_id)
  end

  def self.update_offer(params, work_position_id)
    offer = Offer.find(params[:id])
    offer.update(params)

    persist_offer(offer, work_position_id)
  end

  def self.create_offer(params, work_position_id)
    offer = Offer.new(params)

    persist_offer(offer, work_position_id)
  end

  def self.persist_offer(offer, work_position_id)
    if offer.save
      create_associations(offer.id, work_position_id)
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

  def self.create_associations(offer_id, work_position_id)
    OffersWorkPositions.create(offer_id: offer_id, work_position_id: work_position_id)
  end

end
