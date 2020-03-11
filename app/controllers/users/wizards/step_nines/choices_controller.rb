class Users::Wizards::StepNines::ChoicesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = Users::Wizards::StepNines::ChoicesPresenter.new(current_user, cookies_path: cookies[:applied_offer_path])
  end

  def update
    redirect_to users_wizards_step_ten_path
  end
end
