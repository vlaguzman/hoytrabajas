class Users::Wizards::StepThreesController < Users::WizardsController

  def show
    user_presenter(current_user.curriculum_vitae)
  end

  def create
    updated_curriculum = Users::Wizards::StepThreeService.(curriculum_vitae: current_user.curriculum_vitae, update_params: step_three_params)

    user_presenter(updated_curriculum)

    validate_redirect_to(source: updated_curriculum, users_wizard_path: users_wizards_step_four_path)
  end

  private

  def user_presenter(user = current_user)
    @user = Users::Wizards::StepThreePresenter.new(user)
  end

  def step_three_params
    params
    .require(:curriculum_vitae)
    .permit(
      :contract_type_id,
      :labor_disponibility_id,
      job_category_ids: [],
      offer_type_ids:[],
      work_mode_ids:[]
    ).to_h
  end

end
