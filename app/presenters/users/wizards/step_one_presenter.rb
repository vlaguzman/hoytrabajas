class Users::Wizards::StepOnePresenter < ApplicationPresenter

  def form_information(user)
    Users::Wizards::StepOne::FormParamsService.new(
      object: user,
      action_path: users_wizards_step_one_path,
      next_path: users_wizards_step_two_path,
      form_type: :candidate,
      template_translation_path: "users.wizards.step_ones.show",
      form_method: :put
    ).form_params
  end

  private

  def users_wizards_step_one_path
    rails_routes.users_wizards_step_one_path
  end

  def users_wizards_step_two_path
    rails_routes.users_wizards_step_two_path
  end
end
