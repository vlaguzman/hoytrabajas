class Offers::ShowService < ApplicationPresenter

  def initialize(offer)
    @offer = offer
  end

  def details
    offer.attributes.deep_symbolize_keys
      .merge!(close_date: DatesConverter.default(date: offer.close_date) )
      .merge!(sex: sex_description )
      .merge!(age_range: age_range_details)
      .merge!(city: city_description)
      .merge!(languages: laguages_list)
      .merge!(offer_type: offer_type_description)
      .merge!(work_mode: work_mode_description)
      .merge!(contract_type: contract_type_description)
      .merge!(salary: salary_details)
      .merge!(available_work_days: available_work_days_list)
      .merge!(working_days: working_days_list)
      .merge!(job_aids: job_aids_list)
      .merge!(company: company_details)
      .tap { |whitelist| whitelist.except!(*unused_keys) }
  end

  def offer
    @offer
  end

  def id
    @offer.id
  end

  def company
    offer.company
  end

  private

  def unused_keys
    [:release_date, :description_responsibilities, :cellphone, :updated_at, :created_at, :id, :city_id,
      :status, :job_category_id, :offer_type_id, :contract_type_id, :work_mode_id, :sex_id, :company_id]
  end

  def sex_description
    { description: offer.sex.description}
  end

  def age_range
    AgeRange.find_by(offer_id: id)
  end

  def age_range_details
    age_range.attributes.deep_symbolize_keys.slice(:from, :to)

    { from: nil, to: nil }if age_range.nil?
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

  def salary
    OffersSalaries.find_by(offer_id: id)
  end

  def salary_details
    if not salary.nil?
      currency = { currency: { description: salary.currency.description } }
      period = { salary_period: { description: salary.salary_period.description } }

      salary.attributes.deep_symbolize_keys.slice(:from, :to).tap do |field|
        field.merge!(from: number_to_currency(field[:from], precision: 0))
        field.merge!(to: number_to_currency(field[:to], precision: 0))
        field.merge!(currency)
        field.merge!(period)
      end
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
    company
      .attributes
      .deep_symbolize_keys
      .slice(:name, :description, :web_site, :employees_range)
      .tap { |field| field.merge!(employees_range: {description: company.employees_range.description}) }
  end

end
