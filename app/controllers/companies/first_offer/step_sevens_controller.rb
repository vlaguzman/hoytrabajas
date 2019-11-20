class Companies::FirstOffer::StepSevensController < ApplicationController

  def show
#   offer = Offer.find(show_params[:offer_id])
#   offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepSevenService.(company: current_company, update_params: step_seven_params)

    if offer[:status].eql?(:ok)
      redirect_to companies_first_offer_step_eight_path
    else
      offer_presenter(offer[:data])
      render 'show'
    end
  end

  def offer_presenter(offer)
    @offer = Companies::FirstOffer::StepSevenPresenter.new(offer)
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
        :city_id,
        :educational_level_ids,
        :required_experiences_duration,
        :required_experiences_duration_type,
        :required_experience,
    ).to_h
  end
end
