class OffersController < ApplicationController

  MAX_OFFER_LIMIT = 200

  def index
    search_parameters = Offers::Search::ParamsOrganizer.(sanatized_search_params)

    @offers = OffersPresenter.new(nil, current_user: current_user, search_parameters: search_parameters, limit: MAX_OFFER_LIMIT)
  end


  def show
    offer = Offer.find_by(id: sanatized_offer_id)
    @offer = Offers::ShowPresenter.new(offer, current_user: current_user, current_company: current_company, cookies_present: cookies_present )
    delete_cookies
  end

  def update
    offer = Offer.find_by(id: sanatized_offer_update_params[:id])
    offer.update(status: sanatized_offer_update_params[:status])
    redirect_to offer_path(offer)
  end

  private

  def offer_show
    OffersPresenter.new(Offer.find_by(id: show_params[:id]), current_user, cookies_present: cookies_present )
  end

  def sanatized_search_params
    params.include?(:search) ? params.require(:search).permit(
      :keywords,
      :job_categories,
      :city
    ).to_h : {}
  end

  def sanatized_offer_id
    params.permit(:id)[:id]
  end


  def sanatized_offer_update_params
    params.permit(
      :id,
      :status
    ).to_h
  end

  def delete_cookies
    cookies.delete :applied_offer_path if cookies[:applied_offer_path].present?
  end

  def cookies_present
    current_user.present? && cookies[:applied_offer_path].present?
  end
end
