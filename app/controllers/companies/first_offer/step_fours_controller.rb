class Companies::FirstOffer::StepFoursController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = get_offer(show_params)
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
        :offer_type_id,
        :work_mode_id,
        :contract_type_id,
        :vacancies_quantity,
        :close_date,
        :immediate_start,
        :age_range_list_ids => [],
        :sex_ids => []
    ).to_h
  end
end
