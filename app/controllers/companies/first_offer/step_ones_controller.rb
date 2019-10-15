class Companies::FirstOffer::StepOnesController < ApplicationController

  def show
    company_presenter
  end

  def update
    company_presenter
    company = Companies::FirstOffer::StepOneService.(company: current_company, update_params: step_one_params)

    if company[:status] == :ok
      redirect_to companies_first_offer_step_two_path
    else
      company_presenter(company["data"])
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
