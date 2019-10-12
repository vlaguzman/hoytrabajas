module Users::Wizards::StepOne::FormParamsBuilder

  #TODO move genernal method to general class

  FORM_TYPE = :user

  INPUT_FIELDS_KEY = [
    :name,
    :last_name,
    :identification_number,
    :contact_number
  ]

  SELECT_FIELDS_KEYS = [
    :document_type_id
  ]

  MULTIPLE_SELECT_FIELDS_KEYS = [
    :nationality_ids
  ]

  def self.call(path)
    template_translations
      .merge(form: build_form_params(path))
  end

  def self.build_form_params(path)
    {
      buttons:    template_translations[:form][:buttons],
      action:      path,
      method:      :put,
      type:        FORM_TYPE,
      formFields:  fields_builder
    }
  end

  #TODO dont forget private it
  #private

  def self.name_builder(name,multiple=false, *forms)
    form_secuence = forms.map {|value| "[#{value}]" }.join("")
    multiple_name = "[]" if multiple
    "#{FORM_TYPE}#{form_secuence}[#{name}]#{multiple_name}"
  end

  def self.fields_builder
    {}
    .merge(input_fields_builder)
    .merge(select_fields_builder)
    .merge(multiple_select_fields_builder)

  end

  def self.input_fields_builder
    Hash[INPUT_FIELDS_KEY.collect { |key| field_data_builder(key, name: name_builder(key), label:labels[key]) } ]
  end

  def self.select_fields_builder
    Hash[SELECT_FIELDS_KEYS.collect { |key| field_data_builder(key, name: name_builder(key), label:labels[key], values: self.send("#{key}_list")) } ]
  end

  def self.multiple_select_fields_builder
    Hash[MULTIPLE_SELECT_FIELDS_KEYS.collect { |key| field_data_builder(key, name: name_builder(key, true), label:labels[key], values: self.send("#{key}_list")) } ]
  end

  def self.template_translations
    I18n
      .t("users.wizards.step_ones.show")
      .deep_symbolize_keys
  end

  def self.nationality_ids_list
    ListConverter.model_list Nationality
  end

  def self.document_type_id_list
    ListConverter.model_list DocumentType
  end


  def self.labels
    labels = template_translations[:form][:formFields]
  end

  def self.field_data_builder(key, **params)
    [key, params]
  end

end