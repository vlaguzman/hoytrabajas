class OffersPresenter < ApplicationPresenter

  attr_accessor :source, :current_user

  def initialize(source, current_user)
    @source = source
    @current_user = current_user
  end

  def show_details
    Offers::ShowService.new(source, current_user).details
  end

  def related_offer_show
    OffersService.related_offers_show_details(source.id, source.job_categories, current_user)
  end

  def index_details
    Offers::IndexService.new(source).details
  end

  def component_translations
    I18n.t('offers')
  end
end
