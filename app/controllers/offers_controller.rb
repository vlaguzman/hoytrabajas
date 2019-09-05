class OffersController < ApplicationController
  def index
    @offers = Offer.active
  end
end
