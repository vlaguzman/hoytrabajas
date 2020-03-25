module Offers::CarouselOffersService
  extend OffersService

  def self.call(curriculum_vitae_id = nil, limit: nil)

  end

  # private

  def self.build_offer_ids_list(curriculum_vitae_id = nil, limit: nil)
    Offers::CarousalOffersService::ListBuilder.(curriculum_vitae_id, limit: limit)
  end



end