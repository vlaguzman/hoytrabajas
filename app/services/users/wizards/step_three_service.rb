module Users::Wizards::StepThreeService
  def self.call(curriculum_vitae: _, update_params: {})
    Users::WizardService.update_curriculum_vitae(curriculum_vitae, update_params: update_params)[0]
  end
end