class Companies::FirstOffer::StepZerosController < ApplicationController

  def show
    company_step_zero_presenter
  end

  def company_step_zero_presenter(company: current_company)
    @company = Companies::FirstOffer::StepZeroPresenter.new(company)
  end

end
