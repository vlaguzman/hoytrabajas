class Users::Wizards::StepFivePresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepFive::FormParamsService.new(
      errors: source.errors,
      form_type: :user,
      template_translation_path: "users.wizards.step_fives.show",
      action_path: users_wizards_step_five_path,
      previous_path: users_wizards_step_four_path,
      next_path: users_wizards_step_seven_path,
      form_method: :put
    ).form_params
  end

  private

  def users_wizards_step_five_path
    rails_routes.users_wizards_step_five_path
  end

  def users_wizards_step_seven_path
    rails_routes.users_wizards_step_seven_path
  end

  def users_wizards_step_four_path
    rails_routes.users_wizards_step_four_path
  end

end