class Companies::FirstOffer::StepThreesController < ApplicationController

  def new
    offer = Offer.new
    offer_presenter(offer)
  end

  def create
    offer = Companies::FirstOffer::StepThreeService.(company: current_company, create_params: step_three_params)

    if offer[:status].eql?(:ok)
      redirect_to edit_companies_first_offer_step_four_path(offer[:data].id)
    else
      offer_presenter(offer[:data])
      render 'new'
    end
  end

  def offer_presenter(offer)
    @offer = Companies::FirstOffer::StepThreePresenter.new(offer)
  end

  private

  def step_three_params
    params
      .require(:offer)
      .permit(
        :title,
        :job_category_id,
        :offer_work_position_id,
        :offer_type_id,
        :work_mode_id
    ).to_h
  end
end
