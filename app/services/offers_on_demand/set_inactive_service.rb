module OffersOnDemand::SetInactiveService

  def self.call(limit_date: Date.today)

    active_offers = OfferOnDemand
      .where(status: OfferOnDemand::ONDEMAND_STATUS[0])
      .select { |on_demans| on_demans.finish_at.present? }
      .select { |on_demans| on_demans.finish_at.to_date <= limit_date }

    switch_to_down(active_offers)
  end

  private

  def self.switch_to_down(active_offers)
    active_offers.map do |offer|
      offer.status = OfferOnDemand::ONDEMAND_STATUS[1]
      offer.save
      {
        on_demand_offer: offer.id,
        on_demand_offer_valid: offer.valid?,
        on_demand_offer_errors: offer.errors.details
      }
    end
    .select { |offer| !offer[:on_demand_offer_valid] }

  end

end