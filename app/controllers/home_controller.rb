class HomeController < ApplicationController
  def index
    @offers = OffersService.active_offers_index_details
  end
end
