class Users::Wizards::StepEightPresenter < Users::WizardsPresenter

  def show_form_information
    Users::Wizards::StepEight::FormParamsService.new(
      service_params
    ).form_params
  end

  private

  def service_params
    super(
      template_translation_path: 'users.wizards.step_eights.show',
      form_type: :work_experience,
      action_path: users_wizards_step_eight_path,
      previous_path: users_wizards_step_seven_path,
      next_path: users_wizards_step_nines_choices_path
    )
  end

  def users_wizards_step_nines_choices_path
    rails_routes.users_wizards_step_nines_choices_path
  end

  def users_wizards_step_seven_path
    rails_routes.users_wizards_step_seven_path
  end

  def users_wizards_step_eight_path
    rails_routes.users_wizards_step_eight_path
  end
end