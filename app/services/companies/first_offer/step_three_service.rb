module Companies::FirstOffer::StepThreeService

  def self.call(company: _, params: {})
    puts "PARAMS"
    puts params.inspect
    work_position_id = params.delete(:offers_work_positions)
    params.merge!({company_id: company.id})

    params[:id].present? ? update_offer(params, work_position_id) : create_offer(params, work_position_id)
  end

  def self.update_offer(params, work_position_id)
    offer = Offer.find(params[:id])
    update_params = clean_params(params)
    offer.update(update_params)

    persist_offer(offer, work_position_id)
  end

  def self.create_offer(params, work_position_id)
    new_params = clean_params(params)
    puts "PARAMS"
    puts new_params.inspect
    offer = Offer.new(new_params)

    persist_offer(offer, work_position_id)
  end

  def self.clean_params(params)
    job_category_ids = params[:job_category_ids].split(",").map(&:to_i)
    params
      .inject({}) { |params, (key, value)| params[:job_category_ids] = job_category_ids; params }
      .reverse_merge!(params)
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
