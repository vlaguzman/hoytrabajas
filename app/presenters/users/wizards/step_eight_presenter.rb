class Users::Wizards::StepEightPresenter < Users::WizardsPresenter

  def form_information
    Users::Wizards::StepEight::FormParamsService.new(
      service_params
    ).form_params
  end


  def registered_experience
    cv = source.curriculum_vitae
    WorkExperience.user_wizard_step_eight_list(cv.id)
  end

  def have_experience?
    registered_experience.any?
  end

  def registered_experience_message
    count = registered_experience.count
    "Llevas #{count} registro(s) de experiencia laboral" if count > 0
  end

  private

  def service_params
    super(
      #TODO Oscar tmp source nil
      source: nil,
      template_translation_path: 'users.wizards.step_eights.show',
      action_path: users_wizards_step_eight_path,
      previous_path: users_wizards_step_six_path,
      next_path: users_wizards_step_nine_path
    )
  end

  def users_wizards_step_nine_path
    rails_routes.users_wizards_step_nine_path
  end

  def users_wizards_step_six_path
    rails_routes.users_wizards_step_six_path
  end

  def users_wizards_step_eight_path
    rails_routes.users_wizards_step_eight_path
  end
end