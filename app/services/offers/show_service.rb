class Offers::ShowService < ApplicationPresenter

  def initialize(offer)
    @offer = offer
  end

  def details
    offer.attributes.deep_symbolize_keys.tap do |whitelist|
      whitelist.merge!(close_date: DatesConverter.default(date: offer.close_date) )
      whitelist.merge!(sex: sex_description )
      whitelist.merge!(age_range: age_range_details)
      whitelist.merge!(city: city_description)
      whitelist.merge!(languages: laguages_list)
      whitelist.merge!(offer_type: offer_type_description)
      whitelist.merge!(work_mode: work_mode_description)
      whitelist.merge!(contract_type: contract_type_description)
      whitelist.merge!(salary: salary_details)
      whitelist.merge!(available_work_days: available_work_days_list)
      whitelist.merge!(working_days: working_days_list)
      whitelist.merge!(job_aids: job_aids_list)
      whitelist.merge!(company: company_details)

      whitelist.except!(*unused_keys)
    end
  end

  def offer
    @offer
  end

  def id
    @offer.id
  end

  private

  def unused_keys
    [:release_date, :description_responsibilities, :cellphone, :updated_at, :created_at, :id, :city_id,
      :status, :job_category_id, :offer_type_id, :contract_type_id, :work_mode_id, :sex_id, :company_id]
  end

  def sex_description
    { description: offer.sex.description}
  end

  def age_range_details
    range = AgeRange.find_by(offer_id: id)
    if range.nil?
      { from: nil, to: nil }
    else
      range.attributes.deep_symbolize_keys.slice(:from, :to)
    end
  end

  def city_description
    {description: offer.city.description}
  end

  def laguages_list
    LanguagesOffers.where(offer_id: id).map{ |object|  [ "#{object.language.description} #{object.level.description}"]}
  end

  def offer_type_description
    { description: offer.offer_type.description }
  end

  def work_mode_description
    { description: offer.work_mode.description }
  end

  def contract_type_description
    { description: offer.contract_type.description }
  end

  def salary_details
    salary = OffersSalaries.find_by(offer_id: id)
    if not salary.nil?
      {
        from: number_to_currency(salary.from, precision: 0),
        to: number_to_currency(salary.to, precision: 0),
        currency: { description: salary.currency.description },
        salary_period: { description: salary.salary_period.description }
      }
    else
      {
        currency:{ description: nil },
        from: nil,
        salary_period:{ description:nil },
        to: nil
      }
    end
  end

  def available_work_days_list
    AvailableWorkDaysOffers.where(offer_id: id).map { |object| object.available_work_day.description }
  end

  def working_days_list
    OffersWorkingDays.where(offer_id: id).map { |object| object.working_day.description }
  end

  def job_aids_list
    JobAidsOffers.where(offer_id: id).map { |object| object.job_aid.description }
  end

  def company_details
    company = offer.company
    {
      name: company.name,
      description: company.description,
      employess_range: { description: company.employees_range.description },
      web_site: company.web_site
    }
  end

end