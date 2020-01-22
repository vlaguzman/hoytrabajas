module Companies::Dashboards::OffersService

  def self.call(company)
    my_offers(company_offers: company.offers)
  end

  private

  def self.my_offers(company_offers: [])
    my_offers_builder(offers: company_offers)
  end

  def self.my_offers_builder(offers: [])
    offers.map { |offer| offer_params_builder(offer) }
  end

  def self.offer_params_builder(offer)
    {
      id: offer.id,
      title: offer.title,
      approved: applied_offer_approved(offer),
      applied_candidates: applied_offers_count(offer),
      start_date: date_parser(offer.created_at),
      close_date: date_parser(offer.close_date),
      status: offer.status,
      list_candidates_path: rails_routes.companies_list_candidate_path(offer.id)
    }
  end

  def self.applied_offer_approved(offer)
    offer.status.eql?(Offer::OFFER_STATUS[2])
  end

  def self.applied_offers_count(offer)
    offer.applied_offers.count
  end

  def self.date_parser(date)
    DatesManager.default(date: date) if date.present?
  end

  def self.rails_routes
    Rails.application.routes.url_helpers
  end

end
