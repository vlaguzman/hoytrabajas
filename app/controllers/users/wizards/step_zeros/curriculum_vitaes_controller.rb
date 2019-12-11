class Users::Wizards::StepZeros::CurriculumVitaesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    Users::Wizards::StepZero::CurriculumVitaeService.upload_curriculum_vitae(current_user, permit_params[:file_cv])
  end

  private

  def permit_params
    params.require(:user).permit(:file_cv)
  end

end
