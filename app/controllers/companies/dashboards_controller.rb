class Companies::DashboardsController < ApplicationController

  before_action :authenticate_company!

  def show
    company_presenter
    first_sign_in?(current_company, companies_first_offer_step_zero_path)
  end

  private

  def company_presenter(company = current_company)
     @company = Companies::DashboardsPresenter.new(company)
  end

end
