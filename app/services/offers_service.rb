module OffersService

  def self.active_offers_index_details
    Offer.active.map{|offer| Offers::IndexService.new(offer).details }
  end

  def self.related_offers_show_details(id=nil, job_category_id=nil)
    Offer
      .related_job_category(job_category_id)
      .reject { |offer| offer.id.eql?(id) }
      .map { |offer| Offers::IndexService.new(offer).details }
  end

end