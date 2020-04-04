module Companies::FirstOffer::StepFourService

  def self.call(company: _, update_params: {})
    offer = Offer.find_by(id: update_params[:id])
    update_params.except!(:id)

    persist_offer(offer, update_params)
  end

  def self.persist_offer(offer, update_params)
    Companies::FirstOffer::CommonService.update_source(
      offer,
      HashesConverter.sanitize_array_values(hash: update_params)
    )

  end

end
