module Companies::FirstOffer::StepFourService

  def self.call(offer: _, update_params: {})
    updated = offer.update(update_params)

    if updated.save
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

end
