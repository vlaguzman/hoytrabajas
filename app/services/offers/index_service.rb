class Offers::IndexService < Offers::ViewsService

  def initialize(offer)
    super(offer)
  end

  private

  def build_details
    {
      city:                 { description: offer.city_description },
      salary:               salary_details,
      company:              company_details,
      close_date:           DatesConverter.default(date: offer.close_date),
      new_offer:            offer.created_at > 24.hours.ago
    }
  end

end
