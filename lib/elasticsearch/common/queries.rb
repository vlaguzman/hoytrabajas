class Elasticsearch::Common::Queries

  MUST_PARAMS_KEYS =      []
  FILTER_PARAMS_KEYS =    []
  SHOULD_PARAMS_KEYS =    []
  MUST_NOT_PARAMS_KEYS =  []
  MULTIMATCH_PARAM_KEYS = []

  COMMON_QUERY_MATCH_ALL = { match_all: {} }

  QUERY_TYPES = [:match_all, :multi_match, :standard_match]

  MULTIMATCH_QUERY_FIELS = []

  def call(query_type: QUERY_TYPES[2], request_parameters: {})
    execute(query_type, request_parameters)
  end

  def multi_match_builder(query_string: "", query_fiels: self.class::MULTIMATCH_QUERY_FIELS)
    { query: query_string, fields: query_fiels }
  end

  def clauses_groups_builder
    {
      must:       self.class::MUST_PARAMS_KEYS,
      filter:     self.class::FILTER_PARAMS_KEYS,
      should:     self.class::SHOULD_PARAMS_KEYS,
      must_not:   self.class::MUST_NOT_PARAMS_KEYS,
      multimatch: self.class::MULTIMATCH_PARAM_KEYS
    }
  end

  private

  def request_parameters_present_options(query_type: QUERY_TYPES[2], request_parameters: {})
    options = {
      match_all: -> { COMMON_QUERY_MATCH_ALL },
      multi_match: -> { { multi_match: multi_match_builder(**request_parameters) } },
      standard_match: -> { query_builder(**request_parameters) }
    }

    options.default = -> { COMMON_QUERY_MATCH_ALL }

    options[query_type].()

  end

  def execute(query_type, request_parameters)

    query_type = request_parameters.any? ? query_type : QUERY_TYPES[0]

    { query: request_parameters_present_options(query_type: query_type, request_parameters: request_parameters) }
  end

  def query_builder(request_parameters)
    organized_request_parameters = clause_organizer(request_parameters: request_parameters)

    response = { bool: bool_builder(organized_request_parameters) }
    multimatch_includer(request_parameters, query: response)
  end

  def multimatch_includer(request_parameters, query: {}, multimatch_clause: self.class::MULTIMATCH_PARAM_KEYS[0])

    options = {
      true => -> { query },
      false => -> { multimatch_merger(query: query, query_string: request_parameters[multimatch_clause]) }
    }

    options.default = -> { query }

    options[multimatch_keys_present?(parameters_keys: request_parameters.keys)].()

  end

  def multimatch_merger(query: {}, query_string: '')
    query.tap do |field|
      field[:bool][:must] = [ *field[:bool][:must], { multi_match: multi_match_builder(query_string: query_string) }]
    end
  end

  def multimatch_keys_present?(parameters_keys: [])
    keys_not_present = self.class::MULTIMATCH_PARAM_KEYS - parameters_keys
    keys_not_present.any?
  end

  def bool_builder(parameter_organized_by_clause)

    initial_clouse_groups_state = bool_manager::COMMON_BOOL_CLAUSES.reduce({}) { |memory, key| memory.merge(key => {}) }

    parameter_organized_by_clause
      .select { |parameter_key, payload| bool_manager::COMMON_BOOL_CLAUSES.include?(payload[:clause]) }
      .reduce(initial_clouse_groups_state) { |memory, (key, payload)|
        memory.tap { |field| field[payload[:clause]].update(parameter_rebuilder(key, payload[:value])) }
      }
      .select { |clause, parameters| parameters.any? }
      .map { |clause, parameters| {clause => bool_manager.(parameters: parameters, clause: clause)} }
      .reduce({}) { |memory, clause_group| memory.update(clause_group) }

  end

  def bool_manager
    Elasticsearch::Common::BoolBuilders
  end

  def clause_organizer(request_parameters: {})
    request_parameters
      .map { |parameter| clause_allocator(current_parameter: parameter) }
      .flatten
      .reduce({}) {|memory, claused_parameter| memory.merge(claused_parameter) }
  end

  def clause_allocator(current_parameter: [])
    clauses_groups_builder
      .map { |clause_key, clauses| clause_mapper(parameter: current_parameter, clause: clause_key, clauses: clauses) }
      .select {|mapper| mapper.any? }
      .flatten
  end

  def clause_mapper(parameter: [], clause: :must, clauses: self.class::MUST_PARAMS_KEYS)
    clauses
      .select { |clause_key| clause_key.eql? parameter[0] }
      .map { |clause_key| clause_adder(parameter: parameter, clause: clause) }
  end

  def clause_adder(parameter: [], clause: :must)
    {
      parameter[0] => {
        value: parameter[1],
        clause: clause
      }
    }
  end

  def parameter_rebuilder(key, value)
    {key => value}
  end

end