class Offers::CitiesController < ApplicationController

  def show
    offers_presenter

    render 'offers/index'
  end

  private

  def city_id
    city = City.by_unaccent_description(params.permit(:id)[:id]).last
    city.present? && city.id
  end

  def offers_presenter
    @offers = Offer
      .active
      .where(city_id: city_id)
      .map { |offer| Offers::IndexService.new(offer, current_user).details }
  end

end