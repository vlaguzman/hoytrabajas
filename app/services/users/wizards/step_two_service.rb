module Users::Wizards::StepTwoService
  def self.call(candidate: _, update_params: {})

    update_params.merge!(curriculum_vitae: {})

    Users::WizardService.update_step(candidate, update_params: update_params)
  end

end