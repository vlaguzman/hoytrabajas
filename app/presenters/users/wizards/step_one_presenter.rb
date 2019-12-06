class Users::Wizards::StepOnePresenter < ApplicationPresenter

  def edit_form_information
    Users::Wizards::StepOne::FormParamsService.new(
      build_presenter_params(
        template_translation_path: "users.wizards.step_ones.edit",
        form_method: :put
      )
    ).form_params
  end

  def form_information
    Users::Wizards::StepOne::FormParamsService.new(
      build_presenter_params(
        next_path: users_wizards_step_two_path,
        template_translation_path: "users.wizards.step_ones.show"
      )
    ).form_params
  end

  private

  def build_presenter_params(**changes)
    {
      source: source,
      errors: source.errors,
      action_path: users_wizards_step_one_path,
      form_type: :candidate
    }.merge(changes)
  end

  def users_wizards_step_one_path
    rails_routes.users_wizards_step_one_path
  end

  def users_wizards_step_two_path
    rails_routes.users_wizards_step_two_path
  end

end
