module Offers::Organizer::ListBuilder
  extend OffersService

  def self.call(curriculum_vitae_id = nil, limit: nil)
    offer_ids_groups(curriculum_vitae_id, limit: limit)
  end

  private

  def self.offer_ids_groups(curriculum_vitae_id = nil, limit: nil)
    on_demand_ids_list = on_demand_no_applied_offer_ids_list(curriculum_vitae_id, limit: limit)
    all_ids_list = standar_no_applied_offer_ids_list(curriculum_vitae_id, limit: limit)
    standard_ids_list = all_ids_list - on_demand_ids_list

    {on_demand_offer_ids_list: on_demand_ids_list, standard_offer_ids_list: standard_ids_list}
  end

  def self.on_demand_no_applied_offer_ids_list(curriculum_vitae_id = nil, limit: nil)
    on_demand_offer_ids_list - applied_offers_list(curriculum_vitae_id)
  end

  def self.standar_no_applied_offer_ids_list(curriculum_vitae_id = nil, limit: nil )
    offer_ids_list(limit: limit) - applied_offers_list(curriculum_vitae_id)
  end

  def self.on_demand_offer_ids_list
    ids_extractor(active_on_demand_most_recently_created)
  end

  def self.offer_ids_list(limit: nil)
    ids_extractor(active_most_recently_created(limit: limit))
  end

  def self.applied_offers_list(curriculum_vitae_id = nil)
    ids_extractor(applied_offer_by_curriculum_id(curriculum_vitae_id))
  end

end


cv = User.find_by(email: "test@man.com").curriculum_vitae
a = Offers::Organizer::ListBuilder.(curriculum_vitae_id: cv.id, limit: nil)
b = Offers::Organizer::DetailsBuilder.(offer_ids_lists: a)
c = Offers::Organizer::AffinityPercentageSorter.(curriculum_vitae: cv, offer_attributes_lists)
d = Offers::Organizer::Joiner.(offer_attributes_lists: c)