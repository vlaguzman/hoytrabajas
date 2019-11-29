class Companies::DashboardsPresenter < ApplicationPresenter

  def my_offers
    Companies::Dashboards::OffersService.(source)
  end
end