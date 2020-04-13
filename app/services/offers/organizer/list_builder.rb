module Offers::Organizer::ListBuilder
  extend OffersService

  def self.call(curriculum_vitae_id = nil, previous_results: nil, limit: nil)

    offer_ids_groups(curriculum_vitae_id, previous_results: previous_results, limit: limit)
  end

  def self.offer_ids_groups(curriculum_vitae_id = nil, previous_results: nil, limit: nil)
    all_on_demand_ids_list = on_demand_no_applied_offer_ids_list(curriculum_vitae_id, limit: limit)
    all_ids_list = standard_no_applied_offer_ids_list(curriculum_vitae_id, previous_results: previous_results, limit: limit)

    on_demand_ids_list = previous_results.present? ?
      all_on_demand_ids_list.reject { |id| not previous_results.include? id }
      : all_on_demand_ids_list

    standard_ids_list = all_ids_list.reject { |id| on_demand_ids_list.include? id }

    {on_demand_offer_ids_list: on_demand_ids_list, standard_offer_ids_list: standard_ids_list}
  end

  def self.on_demand_no_applied_offer_ids_list(curriculum_vitae_id = nil, limit: nil)
    applied_offers = applied_offers_list(curriculum_vitae_id)
    on_demand_offer_ids_list.reject { |id| applied_offers.include? id }
  end

  def self.standard_no_applied_offer_ids_list(curriculum_vitae_id = nil, previous_results: nil, limit: nil )
    applied_offers = applied_offers_list(curriculum_vitae_id)
    offer_ids_list(previous_results: previous_results, limit: limit).reject { |id| applied_offers.include? id }
  end

  def self.on_demand_offer_ids_list
    ids_extractor(active_on_demand_most_recently_created)
  end

  def self.offer_ids_list(limit: nil, previous_results: nil)
    previous_results.nil? ? ids_extractor(active_most_recently_created(limit: limit)) : limit_size(previous_results, limit: limit)
  end

  def self.applied_offers_list(curriculum_vitae_id = nil)
    ids_extractor(applied_offer_by_curriculum_id(curriculum_vitae_id))
  end

  def self.limit_size(list, limit: nil)
    limit.present? ? list.take(limit) : list
  end

end


