module AddModelErrors::CurriculumVitaes::TechnicalSkills

  def validate_strong_skills(model: nil, strong_skills_list: nil)
    strong_skills_list_invalid?(strong_skills_list) && add_strong_skill_error(model)
  end

  def strong_skills_list_invalid?(strong_skills_list)
    strong_skills_list.is_a?(Array) && strong_skills_list
      .reject { |strong_skill| strong_skill.value?("") }
      .empty?
  end

  def add_strong_skill_error(model)
    model.present? && model.errors.add(:technical_skills, :empty)
    model
  end

end