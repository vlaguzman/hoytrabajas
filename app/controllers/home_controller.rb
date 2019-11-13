class HomeController < ApplicationController
  def index
    @presenter = Home::HomePresenter.new(current_user)
  end
end
