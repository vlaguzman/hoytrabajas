class Companies::FirstOffer::StepThreesController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = params[:offer_id].present? ? Offer.find(params[:offer_id]) : Offer.new
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepThreeService.(company: current_company, params: step_three_params)
    puts "#" * 100
    puts offer.inspect

    if offer[:status].eql?(:ok)
      redirect_to companies_first_offer_step_four_path(offer_id: offer[:data].id)
    else
      offer_presenter(offer[:data])
      render 'show'
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
        :id,
        :title,
        :job_category_id,
        :offers_work_positions,
        :offer_type_id,
        :work_mode_id
    ).to_h
  end
end
