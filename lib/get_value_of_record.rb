class GetValueOfRecord

  attr_reader :source

  def initialize(source)
    @source = source
  end

  def validate_present?(instruction, attribute)
    options = {
      simple:               -> { validate_present_simple(attribute) },
      collection:           -> { validate_present_collection(attribute) },
      relation:             -> { validate_present_relation(attribute) },
      contact_number:       -> { validate_present_contact_number(attribute) },
      travel_disponibility: -> { validate_present_travel_disponibility(attribute) },
      state:                -> { validate_present_born_state(attribute) },
      salary:               -> { validate_present_salary(attribute) }
    }

    options[instruction].()
  end

  #TODO: Refactor these methods in case you need more attributes

  def validate_present_simple(attribute)
    {
      value: source.send(attribute).present? ? source.send(attribute) : empty_translation,
      class_empty: source.send(attribute).present? ? '' : 'incomplete'
    }
  end

  def validate_present_contact_number(attribute)
    {
      value: source.send(attribute).present? ? contact_number_with_format : empty_translation,
      class_empty: source.send(attribute).present? ? '' : 'incomplete'
    }
  end

  def validate_present_travel_disponibility(attribute)
    {
      value: travel_disponibility_with_format.present? ? travel_disponibility_with_format : empty_translation,
      class_empty: ''
    }
  end

  def validate_present_collection(attribute)
    {
      value: source.send(attribute).present? ? source.send(attribute).pluck(:description) : [empty_translation],
      class_empty: source.send(attribute).present? ? '' : 'incomplete'
    }
  end

  def validate_present_relation(attribute)
    {
      value: source.send(attribute).present? ? source.send(attribute).description : empty_translation,
      class_empty: source.send(attribute).present? ? '' : 'incomplete'
    }
  end

  def validate_present_born_state(attribute)
    {
      value: source.born_city_id.present? ? source.born_city.state.description : empty_translation,
      class_empty: source.born_city_id.present? ? '' : 'incomplete'
    }
  end

  def validate_present_salary(attribute)
    {
      value: source.present? ? salary_with_format : empty_translation,
      class_empty: source.present? ?  '' : 'incomplete'
    }
  end

  def contact_number_with_format
    grouped_number = source
      .contact_number
      .to_s
      .match(/(\d{1,3})(\d{1,3})(\d{1,4})|\d/)
    "#{grouped_number[1]} #{grouped_number[2]} #{grouped_number[3]}"
  end

  def travel_disponibility_with_format
    source.travel_disponibility ? I18n.t("profile.travel_disponibility.available") : I18n.t("profile.travel_disponibility.not_available")
  end

  def salary_with_format
    if source.from.present? && source.salary_period.present? && source.currency.present?
      "#{source.currency.description} #{source.from}" + ( source.to.present? ? " a #{source.to}" : '' )  + " / #{source.salary_period.description}" 
    end
  end

  private

  def empty_translation
    I18n.t("profile.empty")
  end
end
