module Users::Dashboards::OffersService

  def self.call(user)
    applied_offers(user_applied_offers: get_user_applied_offers(user.curriculum_vitae))
  end

  private

  def self.applied_offers(user_applied_offers: [])
    applied_offers_builder(applied_offers: user_applied_offers)
  end

  def self.applied_offers_builder(applied_offers: [])
    applied_offers.map { |applied_offer| offer_params_builder(applied_offer) }
  end

  def self.offer_params_builder(applied_offer)
    offer = applied_offer.offer

    {
      id: offer.id,
      title: offer.title,
      people_applied: get_people_applied_count(offer),
      start_date: date_parser(offer.created_at),
      close_date: date_parser(offer.close_date),
      status: active?(offer),
      visit_offer_path: offer_path(offer.id)
    }
  end

  def self.get_people_applied_count(offer)
    AppliedOffer.where(offer: offer).count
  end

  def self.get_user_applied_offers(curriculum_vitae)
    curriculum_vitae.applied_offers
  end

  def self.active?(offer)
    offer.status.eql?(:active)
  end

  def self.date_parser(date)
    DatesManager.default(date: date) if date.present?
  end

  def self.offer_path(id)
    Rails.application.routes.url_helpers.offer_path(id)
  end

end
