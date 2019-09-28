class OffersPresenter < ApplicationPresenter

  def show_details
    Offers::ShowService.new(source).details
  end

end