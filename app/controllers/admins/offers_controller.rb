class Admins::OffersController < ApplicationController
  before_action :authenticate_admin_user!

  def edit
    offer = Offer.find(edit_params[:offer_id])
    offer_presenter(offer)
  end

  def update
    offer = Admins::OffersService.(update_params: update_params)
  end

  private

  def offer_presenter(offer)
   @offer = Admins::OffersPresenter.new(offer)
  end

  def edit_params
    params.permit(:offer_id)
  end

  def update_params
    params
      .require(:offer)
      .permit(
        :id,
        :title,
        :vacancies_quantity,
        :offer_type_id,
        :work_mode_id,
        :contract_type_id,
        :close_date,
        :immediate_start,
        age_range: [
          :to,
          :from,
          :offer_id
        ],
        offer_salary: [
          :to,
          :from,
          :is_range,
          :offer_id,
          :salary_period_id,
          :currency_id
        ],
        job_categories: [],
        work_positions: [],
        sexes: []
    ).to_h
  end
end
