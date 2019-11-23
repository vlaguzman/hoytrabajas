class Users::Wizards::StepSevenPresenter < ApplicationPresenter
  def form_information
    Users::Wizards::StepSeven::FormParamsService.new(
      template_translation_path: "users.wizards.step_sevens.show",
      skip_path: users_wizards_step_nine_path,
      action_path: users_wizards_step_seven_path,
      previous_path: users_wizards_step_six_path,
      next_path: users_wizards_step_nine_path,
      form_method: :put
    ).form_params
  end

  private

  def users_wizards_step_six_path
    rails_routes.users_wizards_step_six_path
  end

  def users_wizards_step_seven_path
    rails_routes.users_wizards_step_seven_path
  end

  def users_wizards_step_nine_path
    rails_routes.users_wizards_step_nine_path
  end

end