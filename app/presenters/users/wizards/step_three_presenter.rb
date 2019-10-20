class Users::Wizards::StepThreePresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepThree::FormParamsService .new(
      form_type: :user,
      template_translation_path: "users.wizards.step_threes.show",
      action_path: users_wizards_step_three_path,
      previous_path: users_wizards_step_two_path,
      next_path: users_wizards_step_four_path,
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

  def users_wizards_step_four_path
    rails_routes.users_wizards_step_four_path
  end

end