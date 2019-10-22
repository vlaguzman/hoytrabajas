# The Offers::ShowService Class do build the hash  with the data used in offer/show template
class Offers::ShowService < Offers::ViewsService

  attr_accessor :offer, :current_user

  def initialize(offer, current_user)
    @offer = offer
    @current_user = current_user
  end

  def build_details
    super().merge(
    {
      sex:                  { description: offer.sex_description },
      offer_type:           { description: offer.offer_type_description },
      work_mode:            { description: offer.work_mode_description },
      contract_type:        { description: offer.contract_type_description },
      age_range:            age_range_details,
      languages:            languages_list_details,
      available_work_days:  available_work_days_list,
      working_days:         working_days_list,
      job_aids:             job_aids_list,
      is_applied:           query_applied,
    })
  end

  def query_applied
    id_vitae = current_user.present? ? current_user.curriculum_vitae_ids.last : 0
    AppliedOffer.where(curriculum_vitae_id: id_vitae, offer_id: offer.id).present?
  end

  private

  def used_keys
    [:title, :address, :immediate_start, :description, :vacancies_quantity, :required_experience]
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
