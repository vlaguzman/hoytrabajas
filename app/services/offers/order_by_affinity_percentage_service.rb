module Offers::OrderByAffinityPercentageService

  def self.call(current_user: nil, offers: [])

    return offers if not current_user.present?
    return [] if not current_user.present? and not offers.present?

    execute(current_user: current_user, offers: offers)
  end

  private

  def self.execute(current_user: nil, offers: [])
    candidate_and_offer_group_list = candidate_and_offer_group_list_builder(current_user: current_user, offers: offers)
    by_affinity_list = by_affinity_list_sorter(candidate_and_offer_group_list)
    offer_list_builder(by_affinity_list)
  end

  def self.candidate_and_offer_group_list_builder(current_user: nil, offers: [])
    offers.map { |offer| candidate_and_offer_group_builder(current_user, offer) }
  end

  def self.by_affinity_list_sorter(candidate_and_offer_group_list)
    puts "FUCK" * 100
    puts candidate_and_offer_group_list.class
    puts "END" * 100
    candidate_and_offer_group_list.sort { |lowest, hightest| hightest[1] <=> lowest[1] }
  end

  def self.offer_list_builder(by_affinity_list, model: Offer)
    by_affinity_list
    .map { |group| Offer.find_by(id: group[0]) }
    .compact
  end

  def self.candidate_and_offer_group_builder(current_user, offer)
    [offer.id, AffinityPercentageService.new(offer, current_user.curriculum_vitae).get_round_affinity.to_i]
  end

end
