class Users::Wizards::StepTensController < ApplicationController

  def show
    user_presenter
  end

  def update
    redirect_to users_wizards_step_eleven_path
  end

  private

  def user_presenter(user: current_user)
    @user = user
  end

end