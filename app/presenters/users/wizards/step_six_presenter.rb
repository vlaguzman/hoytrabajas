class Users::Wizards::StepSixPresenter < ApplicationPresenter

  def soft_skills_list
    SoftSkill.all.map { |object| [object.description, object.id] }
  end

  def job_categories_list
    JobCategory.all.map { |object| [object.description, object.id] }
  end

  def technical_skills_list
    TechnicalSkill.all.map { |object| [object.description, object.id] }
  end

  def levels_list
    Level.all.map { |object| [object.description, object.id] }
  end

  def languages_list
    Language.all.map { |object| [object.description, object.id] }
  end
end