module Users::Wizards::ErrorsService

  def self.call(user, update_params: {})
    validate_nationalities_precense(user, update_params: update_params)
    validate_document_type_precense(user, update_params: update_params)
    user
  end

  def self.validate_nationalities_precense(user, update_params: {})
    update_params[:nationality_ids].present? && !update_params[:nationality_ids].last.present? && user.errors.add(:nationalities, :blank)
  end

  def self.validate_document_type_precense(user, update_params: {})
    !update_params[:document_type_id].present? && user.errors.add(:document_type_id, :blank)
  end

end