module BaseForms::WizardsAutocompleteService
  def autocomplete_select_fields_builder
    Hash[
      self.class::AUTCOMPLETE_SELECT_FIELDS_KEYS.collect { |object_properties|
        key = object_properties[:key]
        field_data_builder(
          key,
          name: name_builder(key, false, []),
          label:labels[key],
          values: self.send("#{key}_list"),
          current_value: autocomplete_field_value_builder(object_properties: object_properties)
        )
      }
    ]
  end

  def autocomplete_field_value_builder(object_properties: {})
    key = object_properties[:key]
    response = source.send(key)
    return nil if response.nil?
    object_properties[:multiple] ? response.pluck(:description) : response.description
  end
end