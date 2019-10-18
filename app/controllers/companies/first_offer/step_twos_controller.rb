class Companies::FirstOffer::StepTwosController < ApplicationController

  def show
    company_presenter
  end

  def update
    company = Companies::FirstOffer::StepTwoService.(company: current_company, update_params: step_two_params)

    if company[:status].eql?(:ok)
      redirect_to companies_first_offer_step_three_path
    else
      company_presenter(company[:data])
      render 'show'
    end
  end

  def company_presenter(company: current_company)
    @company = Companies::FirstOffer::StepTwoPresenter.new(company)
  end

  private

  def step_one_params
    params
      .require(:company)
      .permit(
        :description
    ).to_h
  end
end
