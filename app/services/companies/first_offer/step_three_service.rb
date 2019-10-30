module Companies::FirstOffer::StepThreeService

  def self.call(company: _, create_params: {})
    offers_work_positions_id = create_params.delete(:offers_work_positions)
    create_params.merge!({company_id: company.id})

    puts "#" * 100
    puts create_params.inspect
    offer = Offer.new(create_params)
    persist_offer(offer, offers_work_positions_id)
  end

  def self.persist_offer(offer, offers_work_positions_id)
    if offer.save
      create_associations(offer.id, offers_work_positions_id)
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

  def self.create_associations(offer_id, offers_work_positions_id)
    OffersWorkPositions.create(offer_id: offer_id, offers_work_positions_id: offers_work_positions_id)
  end

end
