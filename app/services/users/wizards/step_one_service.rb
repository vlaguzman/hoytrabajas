module Users::Wizards::StepOneService
  def self.call(candidate: _, update_params: {})
    update_params.merge!(curriculum_vitae: {})

    first_validate_candidate = Users::WizardService.update_step(candidate, update_params: update_params)

    validate_cities_keys_precense(first_validate_candidate, update_params: update_params)

  end

  private

  def self.validate_cities_keys_precense(candidate, update_params: {})
    keys_to_validate = [:born_city_id, :residence_city_id]

    present_valid_keys = update_params
      .deep_symbolize_keys
      .keep_if { |key, value| keys_to_validate.include?(key) }
      .keys

    keys_to_validate
      .difference(present_valid_keys)
      .each { |error_key| candidate.errors.add(error_key, :blank) }

    candidate
  end

end