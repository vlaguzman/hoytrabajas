class Users::Wizards::StepEightPresenter < ApplicationPresenter

  def job_categories_list
    model_list(JobCategory)
  end

  def work_positions_list
    model_list(WorkPosition)
  end

  def work_methodologies_list
    model_list(WorkMethodology)
  end

  def cities_list
    model_list(City)
  end

  def technical_skills_list
    model_list(TechnicalSkill)
  end

  def registered_experience
    cv = source.curriculum_vitaes.first.id
    WorkExperience.where(curriculum_vitae_id: cv).map { |exp| [exp.company_name, exp.work_position.description] }
  end

  def have_experience?
    registered_experience.any?
  end

  def registered_experience_message
    count = registered_experience.count
    if count >= 1
      "Llevas #{count} registro(s) de experiencia laboral"
    end
  end
end