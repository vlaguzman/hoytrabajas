class OffersPresenter < ApplicationPresenter

  def show_details
    Offers::ShowService.new(source).details
  end

  def related_offer_show
    OffersService.new().related_offers_show_details(job_category_id)
  end

  def index_details
    Offers::IndexService.new(source).details
  end
end
