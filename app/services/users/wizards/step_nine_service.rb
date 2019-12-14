module Users::Wizards::StepNineService
  def self.call(educational_level: _, update_params: {})
    persist_educational_level(educational_level, params: update_params)
  end

  private

  def self.persist_educational_level(educational_level, params: {})
    HashesConverter.validate_presence_values(params)
    [educational_level, educational_level.update(params)]
  end

end