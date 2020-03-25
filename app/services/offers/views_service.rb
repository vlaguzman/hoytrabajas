#TODO Oscar refactor this, the RC is in "C"
# this class should be a module and only should reusable methods that help the offer presenters
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
    affinity = get_affinity_percentage
    affinity && "#{affinity}%"
  end

  def used_keys
    [:id, :title, :immediate_start, :description, :required_experience, :confidential]
  end

  def build_details
    close_date = offer.close_date
    {
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
    current_user.present? && AffinityPercentageService.new(offer, current_user.curriculum_vitae).get_round_affinity
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
    offer.offer_on_demand_status
  end

  def company_logo_image
    logo = offer.company_logo
    logo && logo.attached? ?
      Rails.application.routes.url_helpers.rails_blob_path(logo, disposition: "attachment", only_path: true)
      : DEFAULT_IMAGE_LOGO_URL
  end

  def job_category_image
    image = job_category_image_getter
    image.present? ? image : DEFAULT_IMAGE_CATEGORY_URL
  end

  def job_category_image_getter
    offer.job_category_ids.any? && offer.job_categories.first.image
  end
end
