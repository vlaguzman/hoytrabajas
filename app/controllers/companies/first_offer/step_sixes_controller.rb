class Companies::FirstOffer::StepSixesController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = get_offer(show_params)
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepSixService.(company: current_company, update_params: step_six_params)

    redirect_to_offer_step(:seven, offer)
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
