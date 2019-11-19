class Companies::DashboardsController < ApplicationController

  before_action :authenticate_company!

  def show
    first_sign_in?(current_company, companies_first_offer_step_zero_path)
  end

end
