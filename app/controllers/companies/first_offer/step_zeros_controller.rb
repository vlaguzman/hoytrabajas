class Companies::FirstOffer::StepZerosController < ApplicationController
  before_action :authenticate_company!

  def show
    create_clientify_user current_company, Clientify::DataManager::CONTACT_COMPANY_TAG
    company_step_zero_presenter
  end

  def company_step_zero_presenter(company: current_company)
    @company = Companies::FirstOffer::StepZeroPresenter.new(company)
  end

end
