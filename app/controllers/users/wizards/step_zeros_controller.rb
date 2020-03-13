class Users::Wizards::StepZerosController < ApplicationController
  before_action :authenticate_user!

  def show
    create_clientify_user
    user_step_zero_presenter
  end

  def user_step_zero_presenter(user: current_user)
    @user = Users::Wizards::StepZeroPresenter.new(user)
  end
  
  def create_clientify_user(user: current_user)
    token = Clientify::ApiAuth.new().obtain_token 
    Clientify::DataManager.new(token).create_contact(current_user, Clientify::DataManager::CONTACT_CANDIDATE_TAG)
  end

end
