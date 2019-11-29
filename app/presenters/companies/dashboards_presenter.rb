class Companies::DashboardsPresenter < ApplicationPresenter

  def my_offers
    Companies::Dashboards::OffersService.(source)
  end

  def component_translations
    I18n.t('companies.dashboards.show')
  end
end