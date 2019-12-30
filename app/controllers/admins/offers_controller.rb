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
        age_range:
        job_categories: [],
        work_positions: [],
        sexes: []
    ).to_h
  end
end
