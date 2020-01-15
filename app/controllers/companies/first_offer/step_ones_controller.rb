class Companies::FirstOffer::StepOnesController < ApplicationController
  before_action :authenticate_company!

  def show
    company_presenter
  end

  def update
    company = Companies::FirstOffer::StepOneService.(company: current_company, update_params: step_one_params)

    if company[:status].eql?(:ok)
      redirect_to companies_first_offer_step_two_path
    else
      company_presenter(company: company[:data])
      render 'show'
    end
  end

  def company_presenter(company: current_company)
    @company = Companies::FirstOffer::StepOnePresenter.new(company)
  end

  private

  def step_one_params
    params
      .require(:company)
      .permit(
        :name,
        :industry_id,
        :contact_name,
        :contact_work_position,
        :contact_cellphone,
        :employees_range_id
    ).to_h
  end
end
