class Users::Wizards::StepNinesController < Users::WizardsController

  def show
    new_educational_level = EducationalLevel.new(curriculum_vitae: current_user.curriculum_vitae)
    educational_level_presenter(new_educational_level)
  end

  def create
    new_educational_level = EducationalLevel.new(curriculum_vitae: current_user.curriculum_vitae)

    added_educational_level, updated = Users::Wizards::StepNineService.(
      educational_level: new_educational_level,
      update_params: step_nine_params
    )

    educational_level_presenter(added_educational_level)

    validate_redirect_to(
      source: added_educational_level,
      users_wizard_path: verify_path(educational_level: added_educational_level, updated: updated)
    )
  end

  private

  def educational_level_presenter(educational_level)
    @educational_level = Users::Wizards::StepNinePresenter.new(educational_level)
  end

  def step_nine_params
    params
      .require(:educational_level)
      .permit(:degree, :institution_name, :start_date, :finish_date, :ongoing_study, :city_id, :diploma)
      .to_h
  end

  def verify_path(educational_level: _, updated: _)
    updated ? users_wizards_step_nines_added_educational_level_path(educational_level) : users_wizards_step_nine_path
  end

end