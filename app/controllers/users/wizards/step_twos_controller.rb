class Users::Wizards::StepTwosController < Users::WizardsController

  def show
    user_presenters
  end

  def create
    user = Users::Wizards::StepTwoService.(candidate: current_user, update_params: strong_params)

    user_presenters(user)

    validate_redirect_to(source: user, users_wizard_path: users_wizards_step_three_path)
  end

  private

  def user_presenters(user = current_user)
    @user = Users::Wizards::StepTwoPresenter.new(user)
  end

  def strong_params
    params.require(:user).permit(:about_me, :sex_id, :birthday, :educational_degree_id, {limitation_ids: []} ).to_h
  end

end