class BaseFormWizardsService

  INPUT_FIELDS_KEY = []
  SELECT_FIELDS_KEYS = []
  MULTIPLE_SELECT_FIELDS_KEYS = []

  attr_accessor :object, :form_type, :template_translation_path, :action_path, :previous_path, :next_path, :form_method

  def initialize(
    object: object,
    form_type: :user,
    template_translation_path: nil,
    action_path: nil,
    previous_path: nil,
    next_path: nil,
    form_method: :post)

    @object                    = object
    @form_type                 = form_type
    @template_translation_path = template_translation_path
    @action_path               = action_path
    @previous_path             = previous_path
    @next_path                 = next_path
    @form_method               = form_method
  end

  def form_params
    template_translations.merge(form: build_form_params) if template_translations.present?
  end

  private

  def buttons_translation
    template_translations[:form][:buttons]
      .merge(previousPath: previous_path)
      .merge(nextPath: next_path) if template_translations.present?
  end

  def template_translations
    translation = I18n.t(template_translation_path)

    translation.deep_symbolize_keys if translation.present?
  end

  def build_form_params
    build_form_base = {
      buttons:    buttons_translation,
      action:     action_path,
      method:     form_method,
      type:       form_type,
      formFields: fields_builder
    }
    build_form_base.merge!(errors_messages)
  end

  def errors_messages
    object.errors.present? ? {errors: object.errors.messages.map{|_, error_messages| error_messages}} : {}
  end

  def fields_builder
    {}
    .merge(input_fields_builder)
    .merge(select_fields_builder)
    .merge(multiple_select_fields_builder)
  end

  def input_fields
    self.class::INPUT_FIELDS_KEY
  end

  def select_fields
    self.class::SELECT_FIELDS_KEYS
  end

  def multiple_select_fields
    self.class::MULTIPLE_SELECT_FIELDS_KEYS
  end

  def input_fields_builder
    Hash[input_fields.collect do |key|
      field_data_builder(key, name: name_builder(key), label: labels[key])
    end]
  end

  def select_fields_builder
    Hash[select_fields.collect do |key|
      field_data_builder(key, name: name_builder(key), label: labels[key], values: self.send("#{key}_list"))
    end]
  end

  def multiple_select_fields_builder
    Hash[multiple_select_fields.collect { |key| field_data_builder(key, name: name_builder(key, true), label:labels[key], values: self.send("#{key}_list")) } ]
  end

  def name_builder(name, multiple=nil, *forms_names)
    form_secuence = forms_names.map {|form_name| "[#{form_name}]" }.join("")
    "#{form_type}#{form_secuence}[#{name}]#{'[]' if multiple.present? }"
  end

  def labels
    template_translations[:form][:formFields] if template_translations.present?
  end

  def field_data_builder(key, **params)
    [key, params]
  end
end
