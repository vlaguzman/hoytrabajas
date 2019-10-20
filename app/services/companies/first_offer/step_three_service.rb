module Companies::FirstOffer::StepThreeService

  def self.call(company: company, create_params: {})
    work_position_id = create_params.delete(:offer_work_position_id)
    create_params.merge!({company_id: company.id})

    offer = Offer.new(create_params)
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
