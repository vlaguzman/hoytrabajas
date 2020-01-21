class Users::Wizards::StepSixesController < Users::WizardsController

  def show
    curriculum_vitae_presenter
  end

  def create
    updated_curriculum = step_six_execute_update_service(current_user.curriculum_vitae)

    curriculum_vitae_presenter(curriculum_vitae: updated_curriculum)

    validate_redirect_to(source: updated_curriculum, users_wizard_path: users_wizards_step_seven_path)
  end

  private

  def step_six_execute_update_service(curriculum_vitae)
    Users::Wizards::StepSixService.new(curriculum_vitae).update(step_six_params)
  end

  def curriculum_vitae_presenter(curriculum_vitae: current_user.curriculum_vitae)
    @curriculum_vitae = Users::Wizards::StepSixPresenter.new(curriculum_vitae)
  end

  def step_six_params
    params
    .require(:curriculum_vitae)
    .permit(
      soft_skill_ids: [],
      technical_skills: [[
        :job_category_id,
        :technical_skill_description,
        :level_id
      ]],
      to_learn_skills:[[
        :job_category_id,
        :technical_skill_description
      ]],
      languages:[[
        :level_id,
        :language_id
      ]],
    ).to_h
  end

end
