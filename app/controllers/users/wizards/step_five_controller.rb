class Users::Wizards::StepFiveController < ApplicationController

  def show
    @user = user_presenter(current_user)
  end

  def update
    @user = Users::Wizards::StepFiveService.(candidate: current_user, update_params: strong_params)

    if @user.errors.details.any?
      @user = user_presenter(current_user)
      render 'show'
    else
      #TODO create step six controller
      #redirect_to users_step_six_path
      render 'users/wizards/step_six/show'
    end
  end

  private

  def user_presenter(user)
    Users::Wizards::StepFivePresenter.new(user)
  end

  def strong_params
    params
    .require(:user)
    .permit(
      curriculum_vitae: {
        available_work_day_ids: [],
        working_day_ids: [],
        curriculum_vitae_salary: [
          :currency_id,
          :from,
          :to,
          :salary_period_id
        ]
      }
    ).to_h
  end

end
