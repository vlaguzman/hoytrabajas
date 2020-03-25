module Offers::Organizer::Joiner

  def self.call(offer_attributes_lists: {}, remove_offer_key: nil)
    join_list = list_joiner(offer_attributes_lists: offer_attributes_lists)
    remove_offer_key ? offer_key_remover(join_list) : join_list
  end

  private

  def self.list_joiner(offer_attributes_lists: {})
    offer_attributes_lists.reduce([]) { |join, (list_key, list)| [*join, *list] }
  end

  def self.offer_key_remover(attributes_list)
    attributes_list.map { |attributes| attributes.reject { |key, value| key.eql? :offer } }
  end

end