class OffersController < ApplicationController
  def index
    @offers = Offer.active
  end

  def show
    @offer = Offer.find_by(id: params[:id])
  end

end
