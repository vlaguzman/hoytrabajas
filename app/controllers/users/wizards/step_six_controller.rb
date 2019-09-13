class Users::Wizards::StepSixController < ApplicationController

  def show
    user_presenter
  end

  def update
    puts strong_params
    #@user = Users::Wizards::StepFiveService.(candidate: current_user, update_params: strong_params)

    #if @user.errors.details.any?
    #  user_presenter
    #  render 'show'
    #else
    #  redirect_to users_step_six_path
    #end
  end

  private

  def user_presenter
    @user = Users::Wizards::StepSixPresenter.new(current_user)
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
