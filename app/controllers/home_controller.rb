class HomeController < ApplicationController
  def index
    @offers = Offer.active
  end
end
