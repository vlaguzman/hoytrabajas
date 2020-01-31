module CompanyService

  #TODO move this variables to model that manage variables for this module
  DEFAULT_STATE_UP       = 'up'
  DEFAULT_STATE_DOWN     = 'down'
  DEFAULT_TIME_OF_DEMAND = 10.days
  DEFAULT_START_AT       = Time.now

  DEFAULT_FINISH_AT = DEFAULT_START_AT + DEFAULT_TIME_OF_DEMAND

  def self.up_offers_on_demands(company)
    offers = company.offers
    offers.each do |offer|
      create_offer_on_demand(offer.id)
    end
  end

  def self.create_offer_on_demand(offer_id)
    offer_on_demand = {
      offer_id: offer_id,
      status: DEFAULT_STATE_UP,
      start_at: DEFAULT_START_AT,
      finish_at: DEFAULT_FINISH_AT
    }
    OfferOnDemand.create(offer_on_demand)
  end

  def self.down_offers_on_demands(company)
    offers = company.offers
    offers.each do |offer|
      update_offer_on_demand(offer.id)
    end
  end

  def self.update_offer_on_demand(offer_id)
    offer_on_demand = OfferOnDemand.find_by(offer_id: offer_id)
    offer_on_demand.update(status: DEFAULT_STATE_DOWN)
  end
end
