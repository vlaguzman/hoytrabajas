class OffersPresenter < ApplicationPresenter
  include OffersService

  def carousal_offers_list
    search_parameters = options[:search_parameters] || {}
    result_ids_list = search_parameters.any? ? ids_extractor(Offer.search_by search_parameters) : []

    current_user = options[:current_user]
    cv = current_user.curriculum_vitae if current_user.present?

    Offers::CarouselOffersService.(cv, previous_results: result_ids_list, limit: options[:limit])

  end

  def adtional_title_description
    options[:adtional_title_description]
  end

  # used in view to build meta tags
  def meta_tags_builders
    city_name = source.city_description if source.present?

    {
      origin: options[:origin] || :default,
      content: options[:content],
      city_name: city_name
    }
  end

  def related_offer_show
    OffersService.related_offers_show_details(source.id, source.job_categories, options[:current_user])
  end


  def component_translations
    I18n.t('offers')
  end
end
