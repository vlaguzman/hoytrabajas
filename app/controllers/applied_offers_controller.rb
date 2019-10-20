class AppliedOffersController < ApplicationController

  def create
    if current_user.present?
      Offers::AppliedOfferService.(user: current_user, params_offer: permit_params)
      redirect_to offer_path(permit_params[:offer_id])
    else
      redirect_to new_user_registration_path
    end
  end

  private

  def permit_params
    params.require(:applied_offer).permit(:offer_id)
  end
end
