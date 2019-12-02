class Companies::FirstOffer::StepFivesController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = get_offer(show_params)
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepFiveService.(company: current_company, update_params: step_five_params)

    redirect_to_offer_step(:six, offer)
  end

  def offer_presenter(offer)
    @offer = Companies::FirstOffer::StepFivePresenter.new(offer)
  end

  private

  def show_params
    params
      .permit(
        :offer_id
    ).to_h
  end

  def step_five_params
    params
      .require(:offer)
      .permit(
        :id,
        :is_range,
        :currency_id,
        :from,
        :to,
        :salary_period_id,
        available_work_day_ids: [],
        working_day_ids: [],
        job_aid_ids: []
    ).to_h
  end
end
