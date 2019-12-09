class Users::Wizards::StepFoursController < Users::WizardsController

  def show
    user_presenters
  end

  def create
    user = Users::Wizards::StepFourService.(candidate: current_user, update_params: strong_params)

    user_presenters

    validate_redirect_to(source: user, users_wizard_path: users_wizards_step_five_path)
  end

  private

  def user_presenters(user = current_user)
    @user = Users::Wizards::StepFourPresenter.new(current_user)
  end

  def strong_params
    params
    .require(:user)
    .permit(
      :city_id,
      driving_licence_ids:[],
      vehicle_ids: [],
      curriculum_vitae: [:travel_disponibility]
    ).to_h
  end

end
