module Users::Wizards::StepFourService
  def self.call(candidate: _, update_params: {})
    update_params = HashesConverter.sanitize_array_values(hash: update_params)

    Users::WizardService.update_step(candidate, update_params: update_params)
  end

end