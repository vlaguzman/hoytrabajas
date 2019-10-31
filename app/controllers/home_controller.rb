class HomeController < ApplicationController
  def index
    @presenter = Home::HomePresenter
  end
end
