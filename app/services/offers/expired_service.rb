module Offers::ExpiredService

  def self.call(limit_date: Date.today)
    no_expired_offers = Offer
      .where.not(status: 'expired')
      .select { |offer|  offer.close_date.present? }
      .select { |offer|  offer.close_date.to_date <= limit_date }

    change_to_expired(no_expired_offers)
  end

  private

  def self.change_to_expired(no_expired_offers)
    no_expired_offers.each do |offer|
      offer.status = 'expired'
      offer.save
    end
  end
end