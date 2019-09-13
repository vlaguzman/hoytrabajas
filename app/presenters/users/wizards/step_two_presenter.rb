class Users::Wizards::StepTwoPresenter < ApplicationPresenter

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