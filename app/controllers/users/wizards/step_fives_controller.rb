class Users::Wizards::StepFivesController < Users::WizardsController

  def show
    user_presenter(current_user.curriculum_vitae)
  end

  def create
    cv = Users::Wizards::StepFiveService.(curriculum_vitae: current_user.curriculum_vitae, update_params: strong_params)

    user_presenter(cv)

    validate_redirect_to(source: cv, users_wizard_path: users_wizards_step_six_path)
  end

  private

  def user_presenter(source = current_user)
    @user = Users::Wizards::StepFivePresenter.new(source)
  end

  def strong_params
    params
    .require(:curriculum_vitae)
    .permit(
      available_work_day_ids: [],
      working_day_ids: [],
      curriculum_vitae_salary: [
        :currency_id,
        :from,
        :to,
        :salary_period_id
      ]
    ).to_h
  end

end
