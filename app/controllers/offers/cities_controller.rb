class Offers::CitiesController < ApplicationController

  def show
    offers_presenter

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
    offer_by_city = Offer
      .active
      .where(city_id: city.id)

    offers_list = Offers::OrderByOnDemand.(offers: offer_by_city)
      .map { |offer| Offers::IndexService.new(offer, current_user).details }

    @offers = {
      offers_list: offers_list,
      origin: :cities,
      content: :default,
      city_name: city.description,
      adtional_title_description: "#{t('in')} #{city.description}"
    }
  end

end