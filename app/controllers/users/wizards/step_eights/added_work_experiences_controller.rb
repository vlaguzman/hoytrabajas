class Users::Wizards::StepEights::AddedWorkExperiencesController < ApplicationController

  def show
    work_experience_presenter(WorkExperience.find_by(id: work_experience_id))
  end

  private

  def work_experience_presenter(work_experience)
    @work_experience = Users::Wizards::StepEights::WorkExperiencePresenter.new(work_experience)
  end

  def work_experience_id
    params[:id]
  end

end