class Elasticsearch::Offers::Queries < Elasticsearch::Common::Queries

  MULTIMATCH_PARAM_KEYS = [:keywords]
  MUST_PARAMS_KEYS = [:status]
  FILTER_PARAMS_KEYS = [:id, :city, :job_categories, :work_mode, :contract_type, :available_work_days, :working_days, :job_aids, :languages]
  SHOULD_PARAMS_KEYS = []
  MUST_NOT_PARAMS_KEYS = []

  MULTIMATCH_QUERY_FIELS = ["description^3", "title^1"]

end