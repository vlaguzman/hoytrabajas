class AppliedOffersController < ApplicationController

  def create
    if current_user.present?
      Offers::AppliedOfferService.(user: current_user, params_offer: permit_params)
      redirect_to offer_path(permit_params[:offer_id])
      send_notifications
    else
      redirect_to new_user_registration_path
    end
  end

  private

  def offer_presenter
    offer = Offer.find(permit_params[:offer_id])
    AppliedOffersPresenter.new(offer, user: current_user)
  end

  def send_notifications
    AppliedOffersMailer.candidate_notification(offer_presenter.mail_data).deliver_later
    AppliedOffersMailer.company_notification(offer_presenter.mail_data).deliver_later
  end

  def permit_params
    params.require(:applied_offer).permit(:offer_id)
  end
end
