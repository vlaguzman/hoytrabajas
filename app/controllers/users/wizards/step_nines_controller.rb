class Users::Wizards::StepNinesController < ApplicationController

  def show
    user_presenter
  end

  def update
    redirect_to users_wizards_step_ten_path
  end

  private

  def user_presenter(user: current_user)
    @user = Users::Wizards::StepNinePresenter.new(user)
  end

end
