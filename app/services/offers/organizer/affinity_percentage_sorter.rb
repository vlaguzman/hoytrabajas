module Offers::Organizer::AffinityPercentageSorter

  def self.call(curriculum_vitae: nil, offer_attributes_lists: {})
    lists_sorter(curriculum_vitae, offer_attributes_lists: offer_attributes_lists)
  end

  def self.lists_sorter(curriculum_vitae, offer_attributes_lists: {})
    offer_attributes_lists.reduce({}) do |attributes_lists, (attributes_list_key, attributes_list)|
      attributes_lists.tap do |field|
        field[attributes_list_key] = affinity_percentage_sorter(curriculum_vitae, offer_attributes_list: attributes_list)
      end
    end
  end

  def self.affinity_percentage_sorter(curriculum_vitae, offer_attributes_list: [])
    offer_attributes_with_affinity_list = affinity_percentage_iterator(curriculum_vitae, offer_attributes_list: offer_attributes_list)
    offer_attributes_with_affinity_list
      .sort_by { |attrs| -attrs[:affinity_percentage] }
      .map { |attrs| attrs.tap { |field| field[:affinity_percentage] = affinity_prettier(field[:affinity_percentage]) } }
    end

  def self.affinity_prettier(percentage)
    "#{percentage.to_i}%" if percentage > Offer::MIN_VALID_AFFINTY_PERCENTAGE
  end

  def self.affinity_percentage_iterator(curriculum_vitae, offer_attributes_list:[])
    offer_attributes_list.map { |offer_attributes| affinity_percentage_getter(curriculum_vitae, offer_attributes: offer_attributes) }
  end

  def self.affinity_percentage_getter(curriculum_vitae, offer_attributes: {})
    offer_attributes.tap do |field|
      field[:affinity_percentage] = field[:offer].affinity_percentage_of(curriculum_vitae)
    end
  end

end