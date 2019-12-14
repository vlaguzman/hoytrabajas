class Users::Wizards::StepTenPresenter < Users::WizardsPresenter

  def show_form_information
    Users::Wizards::StepTen::FormParamsService.new(
      service_params
    ).form_params
  end

  private

  def service_params
    super(
      template_translation_path: 'users.wizards.step_tens.show',
      form_type: :acknowledgment,
      action_path: users_wizards_step_ten_path,
      previous_path: users_wizards_step_nine_path,
      next_path: users_wizards_step_eleven_path,
    )
  end

  def users_wizards_step_nine_path
    rails_routes.users_wizards_step_nine_path
  end

  def users_wizards_step_ten_path
    rails_routes.users_wizards_step_ten_path
  end

  def users_wizards_step_eleven_path
    rails_routes.users_wizards_step_eleven_path
  end
end