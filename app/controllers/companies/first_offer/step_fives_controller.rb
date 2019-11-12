class Companies::FirstOffer::StepFivesController < ApplicationController
  before_action :authenticate_company!

  def show
    offer = Offer.find(show_params[:offer_id])
    offer_presenter(offer)
  end

  def update
    offer = Companies::FirstOffer::StepFiveService.(company: current_company, update_params: step_five_params)

    if offer[:status].eql?(:ok)
      redirect_to companies_first_offer_step_eight_path
    else
      offer_presenter(offer[:data])
      render 'show'
    end
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
        offer: {
          offer_salaries: [
            :salary_type_id,
            :currency_id,
            :from,
            :to,
            :salary_period_id
          ],
          offers_working_days: [
            :working_days_ids
          ],
          available_work_days_offers: [
            :available_work_days_ids
          ],
          job_aids_ids: []
        }
    ).to_h
  end
end
