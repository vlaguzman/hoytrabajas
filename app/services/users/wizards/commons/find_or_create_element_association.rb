module Users::Wizards::Commons::FindOrCreateElementAssociation
  def self.call(parent_source: nil, element_class: nil, element_key: nil, element_params: {}, is_collection: nil)

    previous_saved_element = parent_source.send(element_key)

    new_descriptions = element_params[element_key]

    new_association = persist_new_association(
      element_class: element_class,
      new_descriptions: new_descriptions,
      previous_saved_element: previous_saved_element,
      is_collection: is_collection
    )

    element_params.tap { |field| field[element_key] = new_association }
  end

  private

  def self.persist_new_association(element_class: nil, new_descriptions: nil, previous_saved_element: nil, is_collection: nil)

    parameters = {
      element_class: element_class,
      new_descriptions: new_descriptions,
      previous_saved_element: previous_saved_element
    }

    is_collection ? persist_collection(**parameters) : persist_element(**parameters)
  end

  def self.persist_element(element_class: nil, new_descriptions: nil, previous_saved_element: nil)
    previous_saved_element.present? && previous_saved_element.destroy

    clean_new_description = new_descriptions.strip

    find_or_create_element(element_class: element_class, element_params: { description: clean_new_description})
  end

  def self.persist_collection(element_class: nil, new_descriptions: nil, previous_saved_element: nil)
    previous_saved_element.present? && previous_saved_element.destroy_all

    new_descriptions
      .split(',')
      .map { |new_description| find_or_create_element(element_class: element_class, element_params: { description: new_description.strip }) }
  end

  def self.find_or_create_element(element_class: nil, element_params: {})
    BaseForms::FindOrCreateRecordService.(klass: element_class, search_or_cration_params: element_params )
  end

end