class Offers::ViewsService
  include ActionView::Helpers

  attr_accessor :offer, :current_user

  def initialize(offer, current_user=nil)
    @offer = offer
    @current_user = current_user
  end

  def details
    offer.attributes.deep_symbolize_keys
      .slice(*used_keys)
      .merge(build_details)
  end

  def offer
    @offer
  end

  protected

  def used_keys
    [:title, :immediate_start, :description, :required_experience]
  end

  def build_details
    {
      id_offer:             offer.id,
      city:                 { description: offer.city_description },
      salary:               salary_details,
      company:              company_details,
      close_date:           DatesConverter.default(date: offer.close_date)
    }
  end

  def salary_details
    {
      currency: {
        description: offer.salary_currency_description
      },
      from: number_to_currency(offer.salary_from, precision: 0),
      to: number_to_currency(offer.salary_to, precision: 0),
      salary_period: {
        description: offer.salary_period_description
      }
    }
  end

  def company_details
    {
      name: offer.company_name,
    }
  end

end
