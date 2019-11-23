module Companies::FirstOffer::CommonService

  def self.update_offer(offer = nil, update_params = {})
    if offer.update(update_params)
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

end