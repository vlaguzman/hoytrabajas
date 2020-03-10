module Offers::CompletelyDestroyService
  #WARNING: Don't use if you drunk or high

  def self.call(offer_id: nil)
    offer_found = Offer.find_by(id: offer_id)
    offer_found.present? && destroy_associoations(offer_found)
  end

  private

  def self.destroy_associoations(offer)
    OfferSalary.where(offer: offer).destroy_all
    AgeRange.where(offer: offer).destroy_all
    OfferRequiredExperiences.where(offer: offer).destroy_all
    OfferOnDemand.where(offer: offer).destroy_all
    offer.destroy
  end



end
