module OffersService

  def self.active_offers_index_details
    Offer.active.map{|offer| OffersPresenter.new(offer).index_details}
  end
end
