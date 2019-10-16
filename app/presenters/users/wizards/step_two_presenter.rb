class Users::Wizards::StepTwoPresenter < ApplicationPresenter

  def form_information
    action_path = Rails.application.routes.url_helpers.users_wizards_step_two_path
    next_path = Rails.application.routes.url_helpers.users_wizards_step_three_path
    previous_path = Rails.application.routes.url_helpers.users_wizards_step_three_path

    Users::Wizards::StepTwo::FormParamsService.new(
      action_path: action_path,
      next_path: next_path,
      previous_path: previous_path,
      template_translation_path: "users.wizards.step_twos.show",
      form_method: :put
    ).form_params
  end

  def sexes_list
    Sex.all.map { |object| [object.description, object.id] }
  end

  def limitations_list
    Limitation.all.map { |object| [object.description, object.id] }
  end

  def educational_degrees_list
    EducationalDegree.all.map { |object| [object.description, object.id] }
  end

end