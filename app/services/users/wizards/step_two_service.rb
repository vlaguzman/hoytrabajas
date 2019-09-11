module Users::Wizards::StepTwoService
  def self.call(candidate: _, update_params: {})
    candidate.update(update_params)

    candidate
  end

end