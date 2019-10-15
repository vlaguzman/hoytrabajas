class Users::Wizards::StepOnePresenter < ApplicationPresenter

  def form_information
    form_path = Rails.application.routes.url_helpers.users_wizards_step_one_path
    Users::Wizards::StepOne::FormParamsBuilder.(form_path)
  end

  def nationalities_list
    Nationality.all.map { |object| [object.description, object.id] }
  end

  def document_types_list
    DocumentType.all.map { |object| [object.description, object.id] }
  end

end
