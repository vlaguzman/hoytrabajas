class CompaniesController < ApplicationController

  def show
  end

  def edit
    if current_company.sign_in_count <= 1
      redirect_to companies_first_offer_step_zero_path
    else
      render 'edit'
    end
  end

end
