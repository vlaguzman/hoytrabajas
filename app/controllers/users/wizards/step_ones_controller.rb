class Users::Wizards::StepOnesController < Users::WizardsController

  def show
    user_presenters
  end

  def create
    user = Users::Wizards::StepOneService.(candidate: current_user, update_params: strong_params)

    user_presenters(user)

    validate_redirect_to(
      source: user,
      users_wizard_path: users_wizards_step_two_path
    )
  end

  def edit
    user_presenters
  end

  def update
    user = Users::Wizards::StepOneService.(candidate: current_user, update_params: strong_params)

    user_presenters(user)

    validate_redirect_to(source: user, users_wizard_path: users_dashboard_path, view: :edit)
  end


  private

  def user_presenters(user = current_user)
    @user = Users::Wizards::StepOnePresenter.new(user)
  end

  def strong_params
    params.require(:user).permit(:name, :last_name, :document_type_id, :contact_number, :identification_number, nationality_ids: []).to_h
  end

end