module Users::Wizards::StepThreeService
  def self.call(candidate: _, update_params: {})
    Users::WizardService.update_step(candidate, update_params: update_params)
  end
end