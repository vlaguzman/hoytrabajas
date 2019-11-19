module Companies::FirstOffer::StepSixService

  def self.call(company: _, update_params: {})
    offer = Offer.find_by(id: update_params[:id])

    persist_offer(offer, update_params)
  end

  def self.persist_offer(offer, params)
    update_params = clean_params(params)

    updated = offer.update(update_params)
    if updated
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

  def self.clean_params(params)
    responsibility_ids  = prepare_params(params[:responsibility_ids])
    requirement_ids     = prepare_params(params[:requirement_ids])
    vehicle_ids         = prepare_params(params[:vehicle_ids])
    driving_licence_ids = prepare_params(params[:driving_licence_ids])

    params
      .inject({}) { |params, (key, value)|
        params[:responsibility_ids]  = responsibility_ids;
        params[:requirement_ids]     = requirement_ids;
        params[:vehicle_ids]         = vehicle_ids;
        params[:driving_licence_ids] = driving_licence_ids;
        params
      }
  end

  def self.prepare_params(param_key)
    param_key.first.split(",").map(&:to_i)
  end
end
