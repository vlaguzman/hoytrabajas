class Users::Wizards::StepFourPresenter < Users::WizardsPresenter

  def show_form_information
    Users::Wizards::StepFour::FormParamsService.new(
      build_step_four_show_service_params
    ).form_params
  end

  private

  def build_step_four_show_service_params
    service_params(
      template_translation_path: "users.wizards.step_fours.show",
      action_path: users_wizards_step_four_path,
      previous_path: users_wizards_step_three_path,
      next_path: users_wizards_step_five_path,
    )
  end

  def users_wizards_step_five_path
    rails_routes.users_wizards_step_five_path
  end

  def users_wizards_step_three_path
    rails_routes.users_wizards_step_three_path
  end

  def users_wizards_step_four_path
    rails_routes.users_wizards_step_four_path
  end

end
