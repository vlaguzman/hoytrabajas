class Users::Wizards::StepEightPresenter < ApplicationPresenter

  def job_categories_list
    JobCategory.all.map { |object| [object.description, object.id] }
  end

  def work_positions_list
    WorkPosition.all.map { |object| [object.description, object.id] }
  end

  def work_methodologies_list
    WorkMethodology.all.map { |object| [object.description, object.id] }
  end

  def cities_list
    City.all.map { |object| [object.description, object.id] }
  end

  def technical_skills_list
    TechnicalSkill.all.map { |object| [object.description, object.id] }
  end

  def registered_experience
    cv = source.curriculum_vitaes.first.id
    WorkExperience.where(curriculum_vitae_id: cv).map { |exp| [exp.company_name, exp.work_position.description] }
  end
end