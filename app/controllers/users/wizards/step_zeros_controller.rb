class Users::Wizards::StepZerosController < ApplicationController

  def show
    user_step_zero_presenter
  end
  
  def user_step_zero_presenter(user: current_user)
    @user = Users::Wizards::StepZeroPresenter.new(user)
  end

end
