module Offers::Organizer::DetailsBuilder

  DEFAULT_ATTRIBUTES = [:id, :title, :immediate_start, :description, :required_experience, :confidential]

  def self.call(offer_ids_lists: {})
    offer_ids_lists.reduce({}) do |attributes_groups, (group_key, group_list)|
      attributes_groups.tap { |field| field[group_key] = group_list.map { |offer_id| all_offer_attributes(offer_id) }.compact }
    end
  end

  def self.all_offer_attributes(offer_id)
    base = attributes_getter(offer_id)
    carousal_card_attributes(base) if base.present?
  end

  def self.carousal_card_attributes(attributes_base)
    card_attributes = Offers::ViewsService.new(attributes_base[:offer]).build_details

    attributes_base.merge(card_attributes)
  end

  def self.attributes_getter(offer_id)
  found_offer = Offer.find_by(id: offer_id)
  found_offer
    .attributes
    .deep_symbolize_keys
    .slice(*DEFAULT_ATTRIBUTES)
    .merge(offer: found_offer) if found_offer.present?
  end


end