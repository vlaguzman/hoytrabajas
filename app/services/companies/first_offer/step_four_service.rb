module Companies::FirstOffer::StepFourService

  def self.call(company: _, update_params: {})
    offer = Offer.find_by(id: update_params[:id])
    updated = offer.update(update_params)

    if updated.save
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

end
