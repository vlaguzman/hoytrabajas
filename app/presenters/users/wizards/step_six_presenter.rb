class Users::Wizards::StepSixPresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepSix::FormParamsService.new(
      errors: source.errors,
      form_type: :user,
      template_translation_path: "users.wizards.step_sixes.show",
      action_path: users_wizards_step_six_path,
      previous_path: users_wizards_step_five_path,
      next_path: users_wizards_step_seven_path,
      form_method: :put
    ).form_params
  end

  private

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