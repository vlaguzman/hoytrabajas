module Offers::OrderByOnDemand
  def self.call(offers: [])

    offer_on_demand_ids =filter_offer_ids_on_demand(offers)
      .flatten

    offers
      .pluck(:id)
      .prepend(offer_on_demand_ids)
      .flatten
      .uniq
      .map { |offer_id| Offer.find_by(id: offer_id) }
      .compact
  end

  def self.filter_offer_ids_on_demand(offers)
    offers.map do |offer|
      OfferOnDemand
      .where(offer_id: offer.id)
      .select { |offer_on_demand| offer_on_demand.status.eql?( OfferOnDemand::ONDEMAND_STATUS[0] ) }
      .sort_by { |offer_on_demand| offer_on_demand.start_at }
      .map { |offer_on_demand| offer_on_demand.offer_id }
    end
  end
end