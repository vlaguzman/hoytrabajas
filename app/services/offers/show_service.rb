# The Offers::ShowService Class do build the hash  with the data used in offer/show template
class Offers::ShowService
  include ActionView::Helpers

  def initialize(offer)
    @offer = offer
  end

  def details
    offer.attributes.deep_symbolize_keys
      .slice(*used_keys)
      .merge(build_details)
  end

  def build_details
    {
      sex:                  { description: offer.sex_description },
      city:                 { description: offer.city_description },
      offer_type:           { description: offer.offer_type_description },
      work_mode:            { description: offer.work_mode_description },
      contract_type:        { description: offer.contract_type_description },
      age_range:            age_range_details,
      languages:            languages_list_details,
      available_work_days:  available_work_days_list,
      salary:               salary_details,
      working_days:         working_days_list,
      job_aids:             job_aids_list,
      company:              company_details,
      close_date:           DatesConverter.default(date: offer.close_date)
    }
  end

  def offer
    @offer
  end

  private

  def used_keys
    [:title, :address, :immediate_start, :description, :vacancies_quantity, :required_experience ]
  end

  def age_range_details
    {
      from: offer.age_range_from,
      to: offer.age_range_to
    }
  end

  def languages_list_details
    offer.languages_list.map{ |object| [object.offer_show_details] }
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

  def available_work_days_list
    AvailableWorkDaysOffers.where(offer_id: offer.id).map { |object| object.available_work_day.description }
  end

  def working_days_list
    OffersWorkingDays.where(offer_id: offer.id).map { |object| object.working_day.description }
  end

  def job_aids_list
    JobAidsOffers.where(offer_id: offer.id).map { |object| object.job_aid.description }
  end

  def company_details
    {
      name: offer.company_name,
      description: offer.company_description,
      web_site: offer.company_web_site,
      employees_range: { description: offer.company_employees_range_description }
    }
  end

end
