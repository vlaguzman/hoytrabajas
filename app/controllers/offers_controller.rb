class OffersController < ApplicationController
  def index
    query = Offer.active.ransack(params[:q])
    if query.present?
      @offers = query.result(distinct: true).map{ |offer| Offers::IndexService.new(offer).details }
    else
      @offers = OffersService.active_offers_index_details
    end
  end

  def show
    @offer = offer_show
  end

  private

  def offer_show
    OffersPresenter.new(Offer.find_by(id: params[:id]), current_user)
  end

end
