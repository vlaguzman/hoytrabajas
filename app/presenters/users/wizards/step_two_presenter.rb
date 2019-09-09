class Users::Wizards::StepTwoPresenter < ApplicationPresenter

  def sexes_list
    Sex.all
  end

  def limitations_list
    Limitation.all
  end

  def educational_degrees_list
    EducationalDegree.all
  end

end