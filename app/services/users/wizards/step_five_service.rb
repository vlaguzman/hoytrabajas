module Users::Wizards::StepFiveService
  def self.call(candidate: _, update_params: {})
    create_salary_params = update_params[:curriculum_vitae].delete(:curriculum_vitae_salary)

    create_salary_params.merge!(curriculum_vitae: candidate.curriculum_vitae)
    create_curriculum_vitae_salary(create_params: create_salary_params)

    Users::WizardService.update_step(candidate, update_params: update_params)
  end

  private

  def self.create_curriculum_vitae_salary(create_params: {})
    CurriculumVitaeSalary.create(create_params)
  end

end