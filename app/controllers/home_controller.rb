class HomeController < ApplicationController
  def index
    @q = Offer.active.ransack(params[:q])
    @presenter = Home::HomePresenter
  end
end
