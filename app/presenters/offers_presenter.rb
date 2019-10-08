class OffersPresenter < ApplicationPresenter

  def show_details
    Offers::ShowService.new(source).details
  end
  
  def index_details
    Offers::IndexService.new(source).details
  end
end
