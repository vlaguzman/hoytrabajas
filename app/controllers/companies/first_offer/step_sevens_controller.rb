class Companies::FirstOffer::StepSevensController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = get_offer(show_params)
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepSevenService.(company: current_company, update_params: step_seven_params)

    redirect_to_offer_step(:eight, offer)
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
        :educational_degree_id,
        :duration,
        :duration_type_id,
        :required_experience,
        technical_skills: [[
          :technical_skill_id,
          :level_id
        ]],
        languages:[[
          :level_id,
          :language_id
        ]],
    ).to_h
  end

end
