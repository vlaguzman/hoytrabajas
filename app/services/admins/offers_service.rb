module Admins::OffersService

  def self.call(update_params: {})
    offer = Offer.find(update_params[:id])

    Companies::FirstOffer::CommonService.update_source(offer, clean_params(update_params))
  end

  def self.clean_params(params)
    puts "PARAMS -- \n"
    puts params.inspect
    puts "PARAMS -- \n"
    create_or_update_associations(params)
    {
      title:              params[:title],
      vacancies_quantity: params[:vacancies_quantity],
      close_date:         prepare_date(params),
      immediate_start:    params[:immediate_start],
      offer_type_id:      params[:offer_type_id],
      work_mode_id:       params[:work_mode_id],
      contract_type_id:   params[:contract_type_id],
      job_category_ids:   prepare_ids(params[:job_categories]),
      work_position_ids:  prepare_ids(params[:work_positions]),
      sex_ids:            prepare_ids(params[:sexes]),
    }
  end

  def self.create_or_update_associations(params)
    persist_association("age_range", params) if params[:age_range].present?
    persist_association("offer_salary", params) if params[:offer_salary].present?
  end

  def self.persist_association(model, params)
    params = params[model.to_sym]
    object = model.camelize.constantize.find_or_initialize_by(params).save
    object ? { status: :ok, data: object } : { status: :error, data: object }
  end

  def self.prepare_ids(ids)
    ids.map(&:to_i).reject{|id| id == 0}
  end

  def self.prepare_date(params)
    Time.new(params["close_date(1i)"], params["close_date(2i)"], params["close_date(3i)"])
  end
end
