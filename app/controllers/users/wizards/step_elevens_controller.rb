class Users::Wizards::StepElevensController < ApplicationController
  before_action :authenticate_user!

  def show
    raise_login_count(current_user)
    user_presenter
  end

  private

  def user_presenter(user: current_user)
    @user =  Users::Wizards::StepElevenPresenter.new(user)
  end

end