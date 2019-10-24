module Companies::FirstOffer::StepFourService

  def self.call(company: _, update_params: {})
    offer = Offer.find_by(id: update_params[:id])

    offer_age_range = update_params.delete(:offer_age_range).split(",")
    persist_offer(offer, update_params, offer_age_range)
  end

  def self.persist_offer(offer, update_params, offer_age_range)
    create_associations(offer, offer_age_range)
    updated = offer.update(update_params)

    if updated
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

  def self.create_associations(offer, offer_age_range)
    AgeRange.create(offer_id: offer.id, from: offer_age_range[0], to: offer_age_range[1])
  end

end
