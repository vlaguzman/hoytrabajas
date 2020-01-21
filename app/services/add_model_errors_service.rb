class AddModelErrorsService

  VALIDATE_SINGLE_PARAMS = []
  VALIDATE_COLLECTION_PARAMS = []

  def initialize(model, update_params)
    self.model = model
    self.update_params = update_params || {}
  end

  def validate
    validate_single_attributes
    validate_collection_attributes

    model
  end

  def self.call(model, update_params: {})
    self.new(model, update_params).validate
  end

  def validate_single_attributes
    self.class::VALIDATE_SINGLE_PARAMS.map do |param|
        validate_single_element_presence(
          validate_param: param[:key],
          error_key: param[:error_key]
        )
      end
  end

  def validate_collection_attributes
    self.class::VALIDATE_COLLECTION_PARAMS.map do |param|
      validate_collection_presence(
        validate_param: param[:key],
        collection_name: param[:collection_name],
        error_key: param[:error_key]
      )
    end
  end

  def validate_single_element_presence(
    validate_param: nil,
    error_key: nil)

    self.update_params.key?(validate_param) && !self.update_params[validate_param].present? && self.model.errors.add(validate_param, error_key)
  end

  def validate_collection_presence(
    validate_param: nil,
    collection_name: nil,
    error_key: nil)

    self.update_params.key?(validate_param) && !self.update_params[validate_param].last.present? && self.model.errors.add(collection_name, error_key)
  end

  attr_accessor :model, :update_params

end