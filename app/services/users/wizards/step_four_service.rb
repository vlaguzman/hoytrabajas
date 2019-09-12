module Users::Wizards::StepFourService
  def self.call(candidate: _, update_params: {})

    Users::WizardService.update_step(candidate: candidate, update_params: update_params)
  end

end