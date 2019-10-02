class Users::Wizards::StepTensController < ApplicationController

  def show
    user_presenter
  end

  def update
    user = Users::Wizards::StepTenService.(candidate: current_user, update_params: step_ten_params)
    if user.errors.any? || add_other_acknowledgment.any?
      user_presenter(user: user)
      render "show"
    else
      redirect_to users_wizards_step_eleven_path
    end
  end

  private

  def user_presenter(user: current_user)
    @user = Users::Wizards::StepTenPresenter.new(user)
  end

  def add_other_acknowledgment
    params.permit(:add_other_acknowledgment).to_h
  end

  def step_ten_params
    params
    .require(:user)
    .permit(
      {
      curriculum_vitae:{
        acknowledgment: [
          :title,
          :start_date,
          :entity_name,
          :diploma
        ]
      }
    }).to_h
  end

end