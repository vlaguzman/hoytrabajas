class BaseFormWizardsService

  INPUT_FIELDS_KEYS = []
  SELECT_FIELDS_KEYS = []
  MULTIPLE_SELECT_FIELDS_KEYS = []

  attr_accessor :skip_path, :source, :errors, :form_type, :template_translation_path, :action_path, :previous_path, :next_path, :form_method

  def initialize(
    skip_path: nil,
    source: nil,
    errors: nil,
    form_type: :user,
    template_translation_path: nil,
    action_path: nil,
    previous_path: nil,
    next_path: nil,
    form_method: :post)

    @source                    = source
    @errors                    = errors
    @form_type                 = form_type
    @template_translation_path = template_translation_path
    @action_path               = action_path
    @previous_path             = previous_path
    @next_path                 = next_path
    @form_method               = form_method
    @skip_path                 = skip_path
  end

  def form_params
    template_translations.merge(form: build_form_params) if template_translations.present?
  end

  private

  def placeholders_translations
    template_translations[:form][:placeholders].present? ? {}.merge(template_translations[:form][:placeholders]) : {}
  end

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
      placeholders: placeholders_translations,
      buttons:      buttons_translation,
      action:       action_path,
      method:       form_method,
      type:         form_type,
      formFields:   fields_builder
    }
    build_form_base.merge!(errors_messages)
  end

  def errors_messages
    errors.present? ? {errors: errors.messages.map{|_, error_messages| error_messages}} : {}
  end

  def fields_builder(*other_fields)

    object = {}
    .merge(input_fields_builder)
    .merge(select_fields_builder)
    .merge(multiple_select_fields_builder)

    if other_fields.present?
      other_fields.inject(object) { |object, new_object| object.merge(new_object) }
    else
      object
    end
  end

  def input_fields
    self.class::INPUT_FIELDS_KEYS
  end

  def select_fields
    self.class::SELECT_FIELDS_KEYS
  end

  def multiple_select_fields
    self.class::MULTIPLE_SELECT_FIELDS_KEYS
  end

  def input_fields_builder(*subform_names)
    Hash[input_fields.collect do |key|
      field_data_builder(key, name: name_builder(key, false, subform_names), label: labels[key], current_value: current_value(key))
    end]
  end

  def select_fields_builder(*subform_names)
    Hash[select_fields.collect do |key|
      field_data_builder(key, name: name_builder(key, false, subform_names), label: labels[key], values: self.send("#{key}_list"), current_value: current_value(key))
    end]
  end

  def multiple_select_fields_builder(*subform_names)
    Hash[multiple_select_fields.collect { |key| field_data_builder(key, name: name_builder(key, true, subform_names), label:labels[key], values: self.send("#{key}_list"), current_value: current_value(key)) } ]
  end

  def name_builder(name, multiple=nil, subforms_names)
    form_secuence = subforms_names.map {|subform_name| "[#{subform_name}]" }.join("")
    "#{form_type}#{form_secuence}[#{name}]#{'[]' if multiple.present? }"
  end

  def labels
    template_translations[:form][:formFields] if template_translations.present?
  end

  def field_data_builder(key, **params)
    [key, params]
  end

  def current_value(key)
    begin
      source.send(key)
    rescue
     #self.send("#{key}_current_value")
      ''
    end
  end

end
