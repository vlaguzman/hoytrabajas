class CompaniesController < ApplicationController
  def index
  end

  def show
  end

  def edit
    first_sign_in?(current_company, companies_first_offer_step_zero_path)
  end

end
