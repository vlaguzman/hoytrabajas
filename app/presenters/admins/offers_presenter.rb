class Admins::OffersPresenter < ApplicationPresenter

  def languages_offers
    LanguagesOffers.where(offer_id: source.id)
  end

  def offers_technical_skills
    OffersTechnicalSkills.where(offer_id: source.id)
  end

  def get_collection_by_model(model)
    model.all.pluck(:id, :description).map { |value| [ value[0], value[1].truncate(30) ] }

  end

  def get_error_by_model(model, attribute)
    begin
      source.errors.messages[model][0][attribute][0]
    rescue
      ''
    end
  end

  def prepare_key_to_error(model, object_id)
    "#{model}_#{object_id}".to_sym
  end
end
