module Users::Wizards::StepFiveService
  def self.call(curriculum_vitae: _, update_params: {})
    create_salary_params = update_params.delete(:curriculum_vitae_salary)

    create_salary_params.merge!(curriculum_vitae: curriculum_vitae)
    create_curriculum_vitae_salary(create_params: create_salary_params)

    Users::WizardService.update_curriculum_vitae(curriculum_vitae, update_params: update_params)[0]
  end

  private

  def self.create_curriculum_vitae_salary(create_params: {})
    CurriculumVitaeSalary.where(curriculum_vitae: create_params[:curriculum_vitae]).destroy_all

    CurriculumVitaeSalary.create(create_params)
  end

end