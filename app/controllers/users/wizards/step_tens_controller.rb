class Users::Wizards::StepTensController < Users::WizardsController

  def show
    new_acknowledgment = Acknowledgment.new(curriculum_vitae: current_user.curriculum_vitae)
    acknowledgment_presenter(new_acknowledgment)
  end

  def create
    new_acknowledgment = Acknowledgment.new(curriculum_vitae: current_user.curriculum_vitae)

    added_acknowledgment, updated = Users::Wizards::StepTenService.(acknowledgment: new_acknowledgment, update_params: step_ten_params)

    acknowledgment_presenter(added_acknowledgment)

    validate_redirect_to(
      source: added_acknowledgment,
      users_wizard_path: verify_path(acknowledgment: added_acknowledgment, updated: updated)
    )
  end

  private

  def acknowledgment_presenter(acknowledgment)
    @acknowledgment = Users::Wizards::StepTenPresenter.new(acknowledgment)
  end

  def step_ten_params
    params
    .require(:acknowledgment)
    .permit(
      :title,
      :start_date,
      :entity_name,
      :diploma
    ).to_h
  end

  def verify_path(acknowledgment: _, updated: _)
    updated ? users_wizards_step_tens_added_acknowledgment_path(acknowledgment) : users_wizards_step_ten_path
  end

end