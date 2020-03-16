#TODO Oscar refactor this, the RC is in "C"
class Offers::ViewsService
  include ActionView::Helpers

  DEFAULT_IMAGE_CATEGORY_URL = ENV['DEFAULT_IMAGE_CATEGORY_URL']
  DEFAULT_IMAGE_LOGO_URL = ENV['DEFAULT_IMAGE_LOGO_URL']

  attr_accessor :offer, :current_user

  def initialize(offer, current_user = nil)
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

  def affinity_percentage_builder
    current_user.present? && get_affinity_percentage
  end

  private

  def used_keys
    [:title, :immediate_start, :description, :required_experience, :confidential]
  end

  def build_details
    close_date = offer.close_date
    {
      id_offer:             offer.id,
      job_category_image:   job_category_image,
      city:                 { description: offer.city_description },
      salary:               salary_details,
      company:              company_details,
      close_date:           close_date.present? ? DatesManager.default(date: close_date) : DatesManager.default(date: Date.today + 1.day ),
      on_demand:            offer_on_demand_details,
      affinity_percentage:  affinity_percentage_builder,
      applied_offers:       applied_offers_count,
      raw_close_date:       close_date.present? && close_date
    }
  end

  def get_affinity_percentage
    if last_affinity_percentage.present?
      validate_affinity(last_affinity_percentage.affinity_percentage.round)
    else
      validate_affinity(get_new_affinity_percentage)
    end
  end

  def validate_affinity(percentage)
    (percentage >= Offer::MIN_VALID_AFFINTY_PERCENTAGE) && "#{percentage}%"
  end

  def last_affinity_percentage
    AffinityPercentage.get_last(offer.id, current_user.curriculum_vitae.id)
  end

  def get_new_affinity_percentage
    affinity = create_affinity_percentage
    affinity.present? ? affinity.affinity_percentage.round : 0
  end

  def create_affinity_percentage
    AffinityPercentages::CreateAffinityPercentagesService.new.create_affinity(offer, current_user.curriculum_vitae)
  end

  def applied_offers_count
    offer.applied_offers.count
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
      url_image_logo: company_logo_image
    }
  end

  def offer_on_demand_details
    offer_on_demand = OfferOnDemand.find_by(offer_id: offer.id)
    offer_on_demand.present? ? offer_on_demand.status : nil
  end

  def company_logo_image
    offer.company.present? && offer.company.logo.attached? ?
      Rails.application.routes.url_helpers.rails_blob_path(offer.company.logo, disposition: "attachment", only_path: true)
      : DEFAULT_IMAGE_LOGO_URL
  end

  def job_category_image
    category_and_image_present? ? offer.job_categories.first.image : DEFAULT_IMAGE_CATEGORY_URL
  end

  def category_and_image_present?
    offer.job_categories.any? && offer.job_categories.first.image.present?
  end
end
