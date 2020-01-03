module OffersOnDemand::SetInactiveService

  def self.call(limit_date: Date.today)

    active_offers = OfferOnDemand
      .where(status: 'up')
      .select { |on_demans| on_demans.finish_at <= limit_date }

    switch_to_down(active_offers)
  end

  private

  def self.switch_to_down(active_offers)
    active_offers.each do |offer|
      offer.status = 'down'
      offer.save
    end
  end

end