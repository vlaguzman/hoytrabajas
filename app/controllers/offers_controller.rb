class OffersController < ApplicationController
  def index
    @offers = OffersService.new().active_offers_index_details
  end

  def show
    @offer = offer_show
  end

  private

  def offer_show
    OffersPresenter.new(Offer.find_by(id: params[:id]))
  end

end
