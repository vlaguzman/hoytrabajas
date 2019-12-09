class Users::Wizards::StepThreePresenter < Users::WizardsPresenter

  def show_form_information
    Users::Wizards::StepThree::FormParamsService.new(
      build_step_three_show_service_params
    ).form_params
  end

  private

  def build_step_three_show_service_params
    service_params(
      form_type: :curriculum_vitae,
      template_translation_path: "users.wizards.step_threes.show",
      action_path: users_wizards_step_three_path,
      previous_path: users_wizards_step_two_path,
      next_path: users_wizards_step_four_path,
    )
  end

  def users_wizards_step_two_path
    rails_routes.users_wizards_step_two_path
  end

  def users_wizards_step_three_path
    rails_routes.users_wizards_step_three_path
  end

  def users_wizards_step_four_path
    rails_routes.users_wizards_step_four_path
  end

end