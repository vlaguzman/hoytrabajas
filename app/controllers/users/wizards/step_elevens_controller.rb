class Users::Wizards::StepElevensController < ApplicationController
  before_action :authenticate_user!

  def show
    user_presenter
  end

  private

  def user_presenter(user: current_user)
    raise_login_count(current_user)
    @user =  Users::Wizards::StepElevenPresenter.new(user)
  end

  def raise_login_count(user=current_user)
    user.sign_in_count += 1
    user.save
  end

end