class Users::Wizards::StepElevensController < ApplicationController

  def show
    user_presenter
  end

  private

  def user_presenter(user: current_user)
    @user = user
  end

end