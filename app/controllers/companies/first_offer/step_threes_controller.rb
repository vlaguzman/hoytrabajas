class Companies::FirstOffer::StepThreesController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = params[:offer_id].present? ? Offer.find(params[:offer_id]) : Offer.new
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepThreeService.(company: current_company, params: step_three_params)

    redirect_to_offer_step(:four, offer)
  end

  def offer_presenter(offer)
    @offer = Companies::FirstOffer::StepThreePresenter.new(offer)
  end

  private

  def step_three_params
    params
      .require(:offer)
      .permit(
        :id,
        :title,
        :confidential,
        :description,
        :job_category_ids,
        :offers_work_positions,
        :offer_type_id,
        :work_mode_id
    ).to_h
  end
end
