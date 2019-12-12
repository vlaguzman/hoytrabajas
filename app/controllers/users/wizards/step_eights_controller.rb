class Users::Wizards::StepEightsController < Users::WizardsController

  def show
    new_work_experience = WorkExperience.new(curriculum_vitae: current_user.curriculum_vitae)
    work_experience_presenter(new_work_experience)
  end

  def create
    new_work_experience = WorkExperience.new(curriculum_vitae: current_user.curriculum_vitae)

    added_work_experience, updated = Users::Wizards::StepEightService.(
      work_experience: new_work_experience,
      update_params: step_eight_params
    )

    work_experience_presenter(added_work_experience)

    validate_redirect_to(
      source: added_work_experience,
      users_wizard_path: verify_path(work_experience: added_work_experience, updated: updated)
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
      :work_position_id,
      :work_methodology_id,
      :city_id,
      :started_at,
      :finished_at,
      :still_in_progress,
      {
        technical_skill_ids: [],
      }
    ).to_h
  end

  def verify_path(work_experience: _, updated: _)
    updated ? users_wizards_step_eights_added_work_experience_path(work_experience) : users_wizards_step_eight_path
  end

end
