class Companies::ProfilesController < ApplicationController

  def show
    if  company_signed_in? && current_company.email == "test@empresa.com"
      @company = Companies::ProfilesPresenter.new(current_company, show_permit_params)
    else
      redirect_to companies_dashboard_path
    end
  end

  private

  def show_permit_params
    params.permit(:company_id)
  end
end
