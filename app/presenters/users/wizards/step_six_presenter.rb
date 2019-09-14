class Users::Wizards::StepSixPresenter < ApplicationPresenter

  def soft_skills_list
    SoftSkill.all.map { |object| [object.description, object.id] }
  end

end