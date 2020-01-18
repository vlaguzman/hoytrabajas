module BaseForms::WizardsSubFormsService

  def subform_object_builder(form_key, object_type)

    sub_form_fields = self.class::SUBFORMS_FIELDS[object_type]

    {
      object_type => {
        name:        object_type,
        form_keys:   [form_key, object_type],
        field_keys:  sub_form_fields,
        main_label:  template_translations[:sub_forms][object_type],
        list_values: Hash[
          sub_form_fields.collect { |field| [field, self.send("#{field}_list")] }
        ],
        current_values: current_values_of(object_type).()
      }
    }
  end

  def current_values_of(object_type)
    options = {
      technical_skills: :strong_skills,
      languages: :strong_languages
    }

    options.default = object_type

    source.present? ?
        -> {ListConverter.parameters_list(source.send(options[object_type]), self.class::SUBFORMS_FIELDS[object_type])}
      : -> { [] }
  end

end