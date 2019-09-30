class Offers::ViewsService
  def initialize(offer)
    @offer = offer
  end

  def offer
    @offer
  end

  def id
    @offer.id
  end
  
  protected 

  def city_description
    {description: offer.city.description}
  end

  def company_details
    company = offer.company
    {
      name: company.name,
    }
  end

  def salary_details
    salary = OffersSalaries.find_by(offer_id: id)
    unless salary.nil?
      {
        from: number_to_currency(salary.from, precision: 0),
        to: number_to_currency(salary.to, precision: 0),
        currency: { description: salary.currency.description },
        salary_period: { description: salary.salary_period.description }
      }
    else
      {
        from: 0,
        to: 0,
        currency: { description: nil },
        salary_period: { description:nil }
      }
    end
  end

end
