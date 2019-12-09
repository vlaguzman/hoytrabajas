class Users::Wizards::StepFivePresenter < Users::WizardsPresenter

  def show_form_information
    Users::Wizards::StepFive::FormParamsService.new(
      build_step_five_show_service_params
    ).form_params
  end

  private

  def build_step_five_show_service_params
    service_params(
      form_type: :curriculum_vitae,
      template_translation_path: "users.wizards.step_fives.show",
      action_path: users_wizards_step_five_path,
      previous_path: users_wizards_step_four_path,
      next_path: users_wizards_step_six_path,
    )
  end

  def users_wizards_step_five_path
    rails_routes.users_wizards_step_five_path
  end

  def users_wizards_step_six_path
    rails_routes.users_wizards_step_six_path
  end

  def users_wizards_step_four_path
    rails_routes.users_wizards_step_four_path
  end

end