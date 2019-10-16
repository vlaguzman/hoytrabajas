class Users::Wizards::StepOnePresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepOne::FormParamsService.new(
      action_path: users_wizards_step_one_path,
      next_path: users_wizards_step_two_path,
      form_type: :candidate,
      template_translation_path: "users.wizards.step_ones.show",
      form_method: :put
    ).form_params
  end

  def nationalities_list
    Nationality.all.map { |object| [object.description, object.id] }
  end

  def document_types_list
    DocumentType.all.map { |object| [object.description, object.id] }
  end

  private

  def users_wizards_step_one_path
    rails_routes.users_wizards_step_one_path
  end

  def users_wizards_step_two_path
    rails_routes.users_wizards_step_two_path
  end
end