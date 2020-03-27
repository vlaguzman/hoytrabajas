module Offers::Search::ParamsOrganizer

  DEFAULT_PARAMETERS = {
    status: Offer::OFFER_STATUS[2]
  }

  def self.call(sanatized_search_params = {})
    search_params_organizer(sanatized_search_params)
  end

  private

  def self.search_params_organizer(sanatized_search_params = {})

    parameters = HashesConverter
      .remove_empty_keys(sanatized_search_params)
      .deep_symbolize_keys

    divided_parameters = parameters_divider(parameters)

    converted_ids_parameters = paramters_converter(divided_parameters[1])

    parameters_joiner(divided_parameters[0], converted_ids_parameters)
  end

  def self.paramters_converter(ids_parameters = {})

    ids_parameters.map { |k, v| [ k, v.to_s.split(',').map(&:to_i) ] }.to_h
  end

  def self.parameters_divider(parameters)
    (parameters.has_key? :keywords) ? [{keywords: parameters.delete(:keywords) }, parameters] : [{}, parameters]
  end

  def self.parameters_joiner(keywords_part, ids_part)
    keywords_part.merge(ids_part, DEFAULT_PARAMETERS)
  end
end