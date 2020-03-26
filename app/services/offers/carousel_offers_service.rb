module Offers::CarouselOffersService

  def self.call(curriculum_vitae = nil, previous_results: [], limit: nil)
    offer_attributes_list_builder(curriculum_vitae, previous_results: previous_results, limit: limit)
  end

  private

  def self.offer_attributes_list_builder(curriculum_vitae = nil, previous_results: [], limit: nil)
    cv_id = curriculum_vitae && curriculum_vitae.id

    offer_ids_lists = organizer::ListBuilder.(cv_id, previous_results: previous_results, limit: limit)
    offer_attributes_lists = organizer::DetailsBuilder.(offer_ids_lists: offer_ids_lists)
    with_percentage_lists = organizer::AffinityPercentageSorter.(curriculum_vitae: curriculum_vitae, offer_attributes_lists: offer_attributes_lists)

    organizer::Joiner.(offer_attributes_lists: with_percentage_lists, remove_offer_key: true)
  end

  def self.organizer
    Offers::Organizer
  end

end