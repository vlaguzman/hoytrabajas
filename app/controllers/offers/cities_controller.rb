class Offers::CitiesController < ApplicationController

  def show
    @offers = offers_presenter

    render 'offers/index'
  end

  private

  def sanitized_city_name
    params.permit(:id)[:id]
  end

  def cities_name
    StringConverter.replace_chars_to(sanitized_city_name, char_to_replace: "-", new_char: " ")
  end

  def city
    city = City.by_unaccent_description(cities_name).last
    city.present? && city
  end

  def offers_presenter

    OffersPresenter.new(nil,
      current_user: current_user,
      search_parameters: { city: [city.id] },
      origin: :cities,
      content: :default,
      adtional_title_description:"#{t('in')} #{city.description}",
      limit: OffersController::MAX_OFFER_LIMIT
    )

  end

end