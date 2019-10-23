class Companies::FirstOffer::StepFoursController < ApplicationController
  before_action :authenticate_company!

  def edit
    offer = Offer.find(params["format"])
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepFourService.(company: current_company, update_params: step_four_params)

    if offer[:status].eql?(:ok)
      redirect_to edit_companies_first_offer_step_four_path(offer[:data].id)
    else
      offer_presenter(offer[:data])
      render 'new'
    end
  end

  def offer_presenter(offer)
    @offer = Companies::FirstOffer::StepFourPresenter.new(offer)
  end

  private

  def step_four_params
    puts "#" * 100
    puts params.inspect

    params
      .require(:offer)
      .permit(
        :id,
        :contract_type_id,
        :vacancies_quantity,
        :sex_id,
        :offer_age_range,
        :close_date,
        :immediate_start
    ).to_h
  end
end
