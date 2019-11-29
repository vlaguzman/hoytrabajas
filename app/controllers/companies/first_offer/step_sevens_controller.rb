class Companies::FirstOffer::StepSevensController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = Offer.find(show_params[:offer_id])
    offer_presenter(offer)
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

  def step_seven_params
    params
      .require(:offer)
      .permit(
        :id,
        :city_id,
        :educational_level_ids,
        :duration,
        :duration_type,
        :required_experience,
        technical_skills: [[
          :technical_skills_id,
          :level_id
        ]],
        languages:[[
          :level_id,
          :language_id
        ]],
    ).to_h
  end

end
