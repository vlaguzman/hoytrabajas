module Users::Wizards::StepNineService
  def self.call(educational_level: _, update_params: {})
    persit_educational_level(educational_level, params: update_params)
  end

  private

  def self.persit_educational_level(educational_level, params: {})
    validate_presence_values(params)
    [educational_level, educational_level.update(params)]
  end

  def self.validate_presence_values(object={})
    object.delete_if { |_, value| not value.present? }
  end

end