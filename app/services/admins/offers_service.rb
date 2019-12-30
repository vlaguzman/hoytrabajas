module Admins::OffersService
  def self.call(update_params: {})
    offer = Offer.find(update_params[:id])

    Companies::FirstOffer::CommonService.update_source(offer, clean_params(update_params))
  end

  def self.clean_params(params)
    {
      title: params[:title],
      vacancies_quantity: params[:vacancies_quantity],
      offer_type_id: params[:offer_type_id],
      work_mode_id: params[:work_mode_id],
      contract_type_id: params[:contract_type_id],
      job_category_ids: params[:job_categories].map(&:to_i).reject{|id| id == 0},
      work_position_ids: params[:work_positions].map(&:to_i).reject{|id| id == 0},
      sex_ids: params[:sexes].map(&:to_i).reject{|id| id == 0},
    }
  end
end
