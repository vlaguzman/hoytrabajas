class Users::Wizards::StepOnePresenter < ApplicationPresenter

  def form_information
    Users::Wizards::StepOne::FormParamsBuilder.("/users/wizards/step_one")
  end

  def nationalities_list
    Nationality.all.map { |object| [object.description, object.id] }
  end

  def document_types_list
    DocumentType.all.map { |object| [object.description, object.id] }
  end

end
