class Users::Wizards::StepEightsController < ApplicationController
  before_action :authenticate_user!

  def show
    user_presenter
  end

  def update
    user = step_service.()

    if user.errors.details.present? || add_other_experience.any?
      user_presenter(user: user)
      render :show
    else
      redirect_to users_wizards_step_nine_path
    end

  end

  private

  def step_service
    -> (user: current_user) { Users::Wizards::StepEightService.(candidate: user, update_params: step_eight_params) }
  end

  def user_presenter(user: current_user)
    @user = Users::Wizards::StepEightPresenter.new(user)
  end

  def add_other_experience
    params.permit(:add_other_experience).to_h
  end

  def step_eight_params
    params
    .require(:user)
    .permit(
      curriculum_vitae:{
        work_experience:[
          :job_category_id,
          :company_name,
          :work_position_id,
          :work_methodology_id,
          :city_id,
          :started_at,
          :finished_at,
          :still_in_progress,
          {
            technical_skill_ids: [],
          }
        ]
      }
    ).to_h
  end

end
