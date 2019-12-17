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

  protected

  def used_keys
    [:title, :immediate_start, :description, :required_experience]
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
      on_demand:            offer_on_demand_details
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
      url_image_logo: company_logo_image
    }
  end

  def offer_on_demand_details
    offer_on_demand = OfferOnDemand.find_by(offer_id: offer.id)
    offer_on_demand.present? ? offer_on_demand.status : nil
  end

  private

  def company_logo_image
    offer.company.logo.attached? ? 
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
