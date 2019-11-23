module Companies::FirstOffer::StepFiveService

  def self.call(company: _, update_params: {})
    offer = Offer.find_by(id: update_params[:id])

    persist_offer(offer, update_params)
  end

  def self.persist_offer(offer, params)
    create_associations(offer, params)
    update_params = clean_params(params)

    Companies::FirstOffer::CommonService.update_offer(offer, update_params)
  end

  def self.create_associations(offer, params)
    offer_salary_entry = {
      offer_id:         params[:id],
      currency_id:      params[:currency_id],
      salary_period_id: params[:salary_period_id],
      from:             params[:from],
      to:               params[:to],
      is_range:         params[:is_range]
    }

    object = OfferSalary.find_by(offer_id: params[:id])
    object.present? ? object.update(offer_salary_entry) : OfferSalary.create(offer_salary_entry)
  end

  def self.clean_params(params)
    params.except!(:id, :currency_id, :salary_period_id, :from, :to, :is_range)

    available_work_day_ids = prepare_params(params[:available_work_day_ids])
    working_day_ids        = prepare_params(params[:working_day_ids])
    job_aid_ids            = prepare_params(params[:job_aid_ids])

    params
      .inject({}) { |params, (key, value)|
        params[:available_work_day_ids] = available_work_day_ids;
        params[:working_day_ids]        = working_day_ids;
        params[:job_aid_ids]            = job_aid_ids;
        params
      }
  end

  def self.prepare_params(param_key)
    param_key.first.split(",").map(&:to_i)
  end
end
