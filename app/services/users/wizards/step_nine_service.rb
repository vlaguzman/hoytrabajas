module Users::Wizards::StepNineService
  def self.call(source: _, update_params: {})
    persist_educational_level(source, params: update_params)
  end

  private

  def self.persist_educational_level(educational_level, params: {})
    HashesConverter.remove_empty_keys(params)
    [educational_level, educational_level.update(params)]
  end

end