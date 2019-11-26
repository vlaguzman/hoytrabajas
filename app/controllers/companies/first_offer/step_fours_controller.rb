class Companies::FirstOffer::StepFoursController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = Offer.find(show_params[:offer_id])
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepFourService.(company: current_company, update_params: step_four_params)

    redirect_to_offer_step(:five, offer)
  end

  def offer_presenter(offer)
    @offer = Companies::FirstOffer::StepFourPresenter.new(offer)
  end

  private

  def show_params
    params
      .permit(
        :offer_id
    ).to_h
  end

  def step_four_params
    params
      .require(:offer)
      .permit(
        :id,
        :contract_type_id,
        :vacancies_quantity,
        :offer_age_range,
        :close_date,
        :immediate_start,
        :sex_ids => []
    ).to_h
  end
end
