class Users::Wizards::StepOnePresenter < Users::WizardsPresenter

  def show_form_information
    Users::Wizards::StepOne::FormParamsService.new(
      build_step_one_show_service_params
    ).form_params
  end

  def edit_form_information
    Users::Wizards::StepOne::FormParamsService.new(
      build_step_one_edit_service_params
    ).form_params
  end

  private

  def build_step_one_show_service_params
    service_params(
      action_path: users_wizards_step_one_path,
      template_translation_path: "users.wizards.step_ones.show"
    )
  end

  def build_step_one_edit_service_params
    service_params(
      action_path: users_wizards_step_one_path,
      template_translation_path: "users.wizards.step_ones.edit",
      form_method: :put
    )
  end

  def users_wizards_step_one_path
    rails_routes.users_wizards_step_one_path
  end

end