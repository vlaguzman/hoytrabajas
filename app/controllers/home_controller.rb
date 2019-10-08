class HomeController < ApplicationController
  def index
    @offers = OffersService.new().active_offers_index_details
  end
end
