class Users::Wizards::StepNinePresenter < Users::WizardsPresenter

  def show_form_information
    Users::Wizards::StepNine::FormParamsService.new(
      service_params
    ).form_params
  end

  private

  def service_params
    super(
      template_translation_path: 'users.wizards.step_nines.show',
      form_type: :educational_level,
      action_path: users_wizards_step_nine_path,
      previous_path: users_wizards_step_nines_choices_path,
      next_path: users_wizards_step_eleven_path
    )
  end

  def users_wizards_step_nine_path
    rails_routes.users_wizards_step_nine_path
  end

  def users_wizards_step_nines_choices_path
    rails_routes.users_wizards_step_nines_choices_path
  end

  def users_wizards_step_eleven_path
    validate_cookie_path(source, options[:cookies], rails_routes.users_wizards_step_eleven_path)
  end

end
