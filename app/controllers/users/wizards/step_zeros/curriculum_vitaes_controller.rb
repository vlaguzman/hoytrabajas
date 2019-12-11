class Users::Wizards::StepZeros::CurriculumVitaesController < ApplicationController
  before_action :authenticate_user!

  def show
    user = current_user
    user.curriculum_vitae.file_cv.attach(params[:file])
    puts "*"*100
    puts params.inspect
    puts "*"*100
  end

end
