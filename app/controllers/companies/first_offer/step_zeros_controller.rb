class Companies::FirstOffer::StepZerosController < ApplicationController
  before_action :authenticate_company!

  def show
    create_clientify_user
    company_step_zero_presenter
  end

  def company_step_zero_presenter(company: current_company)
    @company = Companies::FirstOffer::StepZeroPresenter.new(company)
  end

  def create_clientify_user(user: current_user)
    token = Clientify::ApiAuth.new().obtain_token 
    Clientify::DataManager.new(token).create_contact(current_company, Clientify::DataManager::CONTACT_COMPANY_TAG)
  end
end
