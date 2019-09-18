class Users::Wizards::StepNinesController < ApplicationController

  def show
    user_presenter
  end

  def update
#    user = Users::Wizards::StepNineService.(candidate: current_user, update_params: strong_params)
#
#    if user.errors.any?
#      user_presenter(user: user)
#      render 'show'
#    else
#      redirect_to users_wizards_step_seven_path
#    end
  end

  private

  def user_presenter(user: current_user)
    @user = Users::Wizards::StepNinePresenter.new(user)
  end

  def strong_params
    params
    .require(:user)
    .permit()
    #.to_h
  end

end
