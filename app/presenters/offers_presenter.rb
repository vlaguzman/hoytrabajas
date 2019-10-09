class OffersPresenter < ApplicationPresenter

  def show_details
    Offers::ShowService.new(source).details
  end

  def related_offer_show
    Offers::ShowService.new(source).related_offers
  end

  def index_details
    Offers::IndexService.new(source).details
  end
end
