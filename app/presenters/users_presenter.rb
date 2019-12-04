#TODO test with rspec
class UsersPresenter < ApplicationPresenter

  def dashboard_main_data
    {
      name: source.name,
      last_name: source.last_name,
      telephone: source.contact_number,
      email: source.email,
      location: source.city_description,
      last_update: source.updated_at
    }
  end

  def applied_offers
    Users::Dashboards::OffersService.(source)
  end

end
