class OffersService

  def active_offers_index_details
    Offer.active.map{|offer| OffersPresenter.new(offer).index_details}
  end

  def related_offers_show_details
    
  end

end
