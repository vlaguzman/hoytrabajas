module Users::Wizards::StepTenService
  def self.call(source: _, update_params: {})
    persist_acknowledgment(source, params: update_params)
  end

  private

  def self.persist_acknowledgment(acknowledgment, params: {})
    HashesConverter.remove_empty_keys(params)
    [acknowledgment, acknowledgment.update(params)]
  end

end