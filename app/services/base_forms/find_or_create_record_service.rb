module BaseForms::FindOrCreateRecordService
  def self.call(klass: nil, search_or_cration_params: {})
    self.execute(klass, search_or_cration_params)
  end

  private

  def self.execute(klass, search_or_cration_params)
    klass.present? && valid_params?(klass, search_or_cration_params) && klass.find_or_create_by(search_or_cration_params)
  end

  def self.valid_params?(klass, search_or_cration_params)
    (search_or_cration_params.keys - klass.column_names.map(&:to_sym)).empty?
  end

end