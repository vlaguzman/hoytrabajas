class Offers::ShowPresenter < ApplicationPresenter

  def details
    source.attributes.deep_symbolize_keys.tap do |whitelist|
      whitelist.merge!(close_date: DatesConverter.default(date: source.close_date) )
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

  private

  def unused_keys
    [:release_date, :description_responsibilities, :cellphone, :updated_at, :created_at, :id, :city_id,
      :status, :job_category_id, :offer_type_id, :contract_type_id, :work_mode_id, :sex_id, :company_id]
  end

  def sex_description
    { description: sex.description}
  end

  def age_range_details
    range = AgeRange.find_by(offer: source.id).attributes.deep_symbolize_keys
    range.slice(:from, :to)
  end

  def city_description
    {description: city.description}
  end

  def laguages_list
    LanguagesOffers.where(offer: source.id).map{ |object|  [ "#{object.language.description} #{object.level.description}"]}
  end

  def offer_type_description
    { description: offer_type.description }
  end

  def work_mode_description
    { description: work_mode.description }
  end

  def contract_type_description
    { description: contract_type.description }
  end

  def salary_details
    salary = OffersSalaries.find_by(offer: source.id)
    {
      from: number_to_currency(salary.from, precision: 0),
      to: number_to_currency(salary.to, precision: 0),
      currency: { description: salary.currency.description },
      salary_period: { description: salary.salary_period.description }
    }
  end

  def available_work_days_list
    AvailableWorkDaysOffers.where(offer: source.id).map { |object| object.available_work_day.description }
  end

  def working_days_list
    OffersWorkingDays.where(offer: source.id).map { |object| object.working_day.description }
  end

  def job_aids_list
    JobAidsOffers.where(offer: source.id).map { |object| object.job_aid.description }
  end

  def company_details
    {
      name: company.name,
      description: company.description,
      employess_range: { description: company.employees_range.description },
      web_site: company.web_site
    }
  end

end