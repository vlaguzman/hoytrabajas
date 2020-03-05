module Offers::ExpiredService

  def self.call(limit_date: Date.today)
    no_expired_offers = Offer
      .where.not(status: Offer::OFFER_STATUS[0])
      .select { |offer|  offer.close_date.present? }
      .select { |offer|  offer.close_date.to_date <= limit_date }

    change_to_expired(no_expired_offers)
  end

  private

  def self.change_to_expired(no_expired_offers)
    no_expired_offers
    .map do |offer|
      offer.status = Offer::OFFER_STATUS[0]
      offer.save
      {
        offer: offer.id,
        offer_valid: offer.valid?,
        offer_errors: offer.errors.details
      }
    end
    .select { |offer| !offer[:offer_valid] }
  end
end
