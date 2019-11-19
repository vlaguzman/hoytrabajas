class Companies::FirstOffer::StepSixesController < ApplicationController

  def show
    offer = Offer.find(show_params[:offer_id])
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepSixService.(company: current_company, update_params: step_six_params)

    if offer[:status].eql?(:ok)
      redirect_to companies_first_offer_step_eight_path
    else
      offer_presenter(offer[:data])
      render 'show'
    end
  end

  def offer_presenter(offer)
    @offer = Companies::FirstOffer::StepSixPresenter.new(offer)
  end

  private

  def show_params
    params
      .permit(
        :offer_id
    ).to_h
  end

  def step_six_params
    params
      .require(:offer)
      .permit(
        :id,
        responsibility_ids: [],
        requirement_ids: [],
        vehicle_ids: [],
        driving_licence_ids: []
    ).to_h
  end
end
