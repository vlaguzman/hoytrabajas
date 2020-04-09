class Home::HomePresenter < ApplicationPresenter

  MAX_OFFER_LIMIT = 50

  def filter_form_attributes
    cities = Cities::CitiesWithOffersListService.()

    {
      fields: {
        keywords_field: {
          type: 'text',
          label: I18n.t("home.index.filter_form.fields.keywords.label"),
          name: 'search[keywords]',
          id: 'search_form_keywords'
        },
        job_categories_field: {
          type: 'text',
          label: I18n.t("home.index.filter_form.fields.job_categories.label"),
          name: 'search[job_categories]',
          id: 'search_form_job_categories'
        }
      },
      lists: {
        cities: cities
      }
    }

  end

  def offers
    #TODO Change to carousel offers service in next pr
    #Offers::CarouselOffersService.(source.curriculum_vitae, limit: MAX_OFFER_LIMIT)
    OffersService.active_offers_index_details(source, MAX_OFFER_LIMIT)
  end

  def search_trends_parameters
    Home::SearchTrendsListService.()
  end

  def categories
    categories = JobCategory.all.map do |category|
      attributes = category.attributes.deep_symbolize_keys.slice(:id, :description)

      attributes.tap do |field|
        field[:name] = field[:description]
        field[:img] = "icon_job_category_id_#{field[:id]}.png"
        field[:quantity] = category.offers.active.count
      end
    end
  end
end
