module CompanyService
  def self.up_offers_on_demands(company)
    offers = company.offers
    offers.each do |offer|
      create_offer_on_demand(offer.id)
    end
  end

  def create_offer_on_demand(offer_id)
    offer_on_demand = {
      offer_id: offer_id,
      status: 'up',
      start_at: Date.now,
      finish_at: Date.now + 10)
    }
    OfferOnDemands.create(offer_on_demand)
  end
end
