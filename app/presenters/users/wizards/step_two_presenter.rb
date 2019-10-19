class Users::Wizards::StepTwoPresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepTwo::FormParamsService.new(
      object: user,
      action_path: users_wizards_step_two_path,
      next_path: users_wizards_step_three_path,
      previous_path: users_wizards_step_one_path,
      template_translation_path: "users.wizards.step_twos.show",
      form_method: :put
    ).form_params
  end

  private

  def users_wizards_step_two_path
    rails_routes.users_wizards_step_two_path
  end

  def users_wizards_step_three_path
    rails_routes.users_wizards_step_three_path
  end

  def users_wizards_step_one_path
    rails_routes.users_wizards_step_one_path
  end

end
