class OffersService

  def active_offers_index_details
    Offer.active.map{|offer| Offers::IndexService.new(offer).details }
  end

  def related_offers_show_details(job_category_id=nil)
    Offer
    .related_job_category(job_category_id)
    .to_a
    .map { |offer| Offers::IndexService.new(offer).details }
  end

end