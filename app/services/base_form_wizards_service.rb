class BaseFormWizardsService

  INPUT_FIELDS_KEYS = []
  SELECT_FIELDS_KEYS = []
  MULTIPLE_SELECT_FIELDS_KEYS = []

  SUBFORMS = []
  SUBFORMS_FIELDS = {}

  def initialize( **params )
    self.source                    = params[:source]
    self.errors                    = params[:errors]
    self.form_type                 = params[:form_type] || :user
    self.template_translation_path = params[:template_translation_path]
    self.action_path               = params[:action_path]
    self.previous_path             = params[:previous_path]
    self.next_path                 = params[:next_path]
    self.form_method               = params[:form_method] || :post
    self.skip_path                 = params[:skip_path]
  end

  def form_params
    template_translations.merge(form: build_form_params) if template_translations.present?
  end

  private

  attr_accessor :skip_path, :source, :errors, :form_type, :template_translation_path, :action_path, :previous_path, :next_path, :form_method

  def template_translations
    I18n.t(template_translation_path).deep_symbolize_keys
  end

  def placeholders_translations
    object = template_translations[:form][:placeholders]
    object.present? ? {}.merge(object) : {}
  end

  def buttons_translation
    buttons = template_translations[:form][:buttons]
      .merge(previousPath: previous_path)
      .merge(nextPath: next_path)
      .tap { |object| object.merge!(addOther: object.delete(:add_other) ) } if template_translations.present?
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

  def input_fields_builder(*subform_names)
    Hash[self.class::INPUT_FIELDS_KEYS.collect do |key|
      field_data_builder(key, name: name_builder(key, false, subform_names), label: labels[key], current_value: current_value(key))
    end]
  end

  def select_fields_builder(*subform_names)
    Hash[self.class::SELECT_FIELDS_KEYS.collect do |key|
      field_data_builder(key, name: name_builder(key, false, subform_names), label: labels[key], values: self.send("#{key}_list"), current_value: current_value(key))
    end]
  end

  def multiple_select_fields_builder(*subform_names)
    Hash[self.class::MULTIPLE_SELECT_FIELDS_KEYS.collect { |key| field_data_builder(key, name: name_builder(key, true, subform_names), label:labels[key], values: self.send("#{key}_list"), current_value: current_value(key)) } ]
  end

  def name_builder(name, multiple=nil, subforms_names)
    form_secuence = subforms_names.map {|subform_name| "[#{subform_name}]" }.join("")
    "#{form_type}#{form_secuence}[#{name}]#{'[]' if multiple.present? }"
  end

  def labels
    template_translations[:form][:formFields]
  end

  def field_data_builder(key, **params)
    [key, params]
  end

  def current_value(key)
    if source.present?
      begin
        source.send(key)
      rescue NoMethodError => error
        self.send("#{key}_current_value")
      end
    else
      ''
    end
  end

  def subform_object_builder(form_key, object_type)
    {
      object_type => {
        name:        object_type,
        form_keys:   [form_key, object_type],
        field_keys:  self.class::SUBFORMS_FIELDS[object_type],
        main_label:  template_translations[:sub_forms][object_type],
        list_values: Hash[
          self.class::SUBFORMS_FIELDS[object_type].collect { |field| [field, self.send("#{field}_list")] }
        ],
        current_values: current_values_of(object_type).()
      }
    }
  end

  def current_values_of(object_type)
    options = {
      :technical_skills => lambda { :strong_skills },
      :languages => lambda { :strong_languages },
      nil => lambda { object_type }
    }

    call_of_object = options[object_type].()
    source.present? ? -> { ListConverter.parameters_list(source.send(call_of_object), self.class::SUBFORMS_FIELDS[object_type])} : -> { [] }
  end

end
