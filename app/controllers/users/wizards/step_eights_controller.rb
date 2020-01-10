class Users::Wizards::StepEightsController < Users::WizardsController

  def show
    new_work_experience = WorkExperience.new(curriculum_vitae: current_user.curriculum_vitae)
    work_experience_presenter(new_work_experience)
  end

  def create
    add_associate_object(
      service:  Users::Wizards::StepEightService,
      klass: WorkExperience,
      strong_params: step_eight_params,
      presenter: :work_experience_presenter,
      source_path: :users_wizards_step_eights_added_work_experience_path
    )

  end

  private

  def work_experience_presenter(work_experience)
    @work_experience = Users::Wizards::StepEightPresenter.new(work_experience)
  end

  def step_eight_params
    params
    .require(:work_experience)
    .permit(
      :job_category_id,
      :company_name,
      :work_position,
      :work_methodology_id,
      :city_id,
      :started_at,
      :finished_at,
      :still_in_progress,
      :technical_skills
    ).to_h
  end

end
