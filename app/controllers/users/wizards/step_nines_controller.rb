class Users::Wizards::StepNinesController < ApplicationController

  def show
    user_presenter
  end

  def update
    user = Users::Wizards::StepNineService.(candidate: current_user, update_params: step_nine_params)

    if user.errors.details.any? || add_other_study.any?
      user_presenter(user: user)
      render 'show'
    else
      redirect_to users_wizards_step_ten_path
    end
  end

  private

  def user_presenter(user: current_user)
    @user = Users::Wizards::StepNinePresenter.new(user)
  end

  def add_other_study
    params.permit(:add_other_study).to_h
  end

  def step_nine_params
      params
      .require(:user)
      .permit(
        curriculum_vitae: {
          educational_level: [
            :degree,
            :institution_name,
            :start_date,
            :finish_date,
            :ongoing_study,
            :city_id,
            :diploma
          ]
        }
      ).to_h
  end

end
