module Users::Wizards::ErrorsService

  def self.call(user, update_params: {})

    validate_nationalities_precense(user, update_params: update_params)
    validate_document_type_precense(user, update_params: update_params)
    validate_born_city_id_precense(user, update_params: update_params)
    validate_residence_city_id_precense(user, update_params: update_params)

    user

  end

  def self.validate_nationalities_precense(user, update_params: {})
    update_params.key?(:nationality_ids) && !update_params[:nationality_ids].last.present? && !update_params[:nationality_ids].last.present? && user.errors.add(:nationalities, :blank)
  end

  def self.validate_document_type_precense(user, update_params: {})
    validate_precense(user: user, update_params: update_params, validate_param: :document_type_id, error_key: :blank)
  end

  def self.validate_born_city_id_precense(user, update_params: {})
    validate_precense(user: user, update_params: update_params, validate_param: :born_city_id, error_key: :blank)
  end

  def self.validate_residence_city_id_precense(user, update_params: {})
    validate_precense(user: user, update_params: update_params, validate_param: :residence_city_id, error_key: :blank)
  end

  private

  def self.validate_precense(user: nil, update_params: {}, validate_param: nil, error_key: nil)
    update_params.key?(validate_param) && !update_params[validate_param].present? && user.errors.add(validate_param, error_key)
  end

end
