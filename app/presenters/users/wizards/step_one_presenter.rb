class Users::Wizards::StepOnePresenter < ApplicationPresenter

  def nationalities_list
    Nationality.all
  end

  def document_types_list
    DocumentType.all
  end

end