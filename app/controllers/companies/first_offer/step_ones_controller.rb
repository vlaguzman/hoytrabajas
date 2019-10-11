class Companies::FirstOffer::StepOnesController < ApplicationController

  def show
    company_presenter
  end

  private

  def company_presenter(company: current_user)
    @company = Companies::FirstOffer::StepOnePresenter.new(company)
  end
end
