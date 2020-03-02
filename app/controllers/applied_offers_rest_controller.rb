class AppliedOffersRestController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if current_user.present?
      Offers::AppliedOfferService.(user: current_user, params_offer: permit_params)
      send_notifications
      render json: { success: true }.to_json
    else
      render json: { redirect: new_user_registration_path }.to_json
    end
  end

  def update
    applied_offer_data = permit_params
    
    if company_signed_in?
      applied_offer_verification = Offers::AppliedOfferService.applied_offer_verification(applied_offer_data)
      render json: { data: applied_offer_verification }.to_json
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
    params.require(:applied_offer).permit(:offer_id, :curriculum_vitae_id, :applied_offer_id, :status, :action)
  end
end
