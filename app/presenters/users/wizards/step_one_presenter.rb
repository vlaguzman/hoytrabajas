class Users::Wizards::StepOnePresenter < ApplicationPresenter

  def nationalities_list
    Nationality.all.map { |object| [object.description, object.id] }
  end

  def document_types_list
    DocumentType.all.map { |object| [object.description, object.id] }
  end

end