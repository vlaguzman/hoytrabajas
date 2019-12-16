class Users::Wizards::StepZeros::CurriculumVitaesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def create
    parameter = permit_params[:user]
    if parameter.present?
      Users::Wizards::StepZero::CurriculumVitaeService.upload_curriculum_vitae(current_user, parameter[:file_cv])
      redirect_to users_wizards_step_one_path
    else
      redirect_to users_wizards_step_one_path
    end
  end

  private

  def permit_params
    params.permit(user: :file_cv)
  end

end
