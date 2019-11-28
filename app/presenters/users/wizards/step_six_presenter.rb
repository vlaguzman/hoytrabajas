class Users::Wizards::StepSixPresenter < Users::WizardsPresenter

  def form_information
    Users::Wizards::StepSix::FormParamsService.new(
      service_params
    ).form_params
  end

  private

  def service_params
    super(
      form_type: :curriculum_vitae,
      template_translation_path: "users.wizards.step_sixes.show",
      action_path: users_wizards_step_six_path,
      previous_path: users_wizards_step_five_path,
      next_path: users_wizards_step_seven_path,
      form_method: :post
    )
  end

  def users_wizards_step_five_path
    rails_routes.users_wizards_step_five_path
  end

  def users_wizards_step_six_path
    rails_routes.users_wizards_step_six_path
  end

  def users_wizards_step_seven_path
    rails_routes.users_wizards_step_seven_path
  end

end