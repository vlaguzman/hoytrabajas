module Home::SearchTrendsListService

  DEFAULT_CITIES = -> {[
    find_and_pluck_by(City, description: "Bogotá"),
    find_and_pluck_by(City, description: "Medellín"),
    find_and_pluck_by(City, description: "Bucaramanga"),
    find_and_pluck_by(City, description: "Santa Marta"),
    find_and_pluck_by(City, description: "Villavicencio")
  ]}

  DEFAULT_JOB_CATEGORIES = -> {[
    find_and_pluck_by(JobCategory, description: 'Gestión administrativa'),
    find_and_pluck_by(JobCategory, description: 'Ventas y comercial'),
    find_and_pluck_by(JobCategory, description: 'Operario'),
    find_and_pluck_by(JobCategory, description: 'Tecnología y programación'),
    find_and_pluck_by(JobCategory, description: 'Cocina, bar y meseros')
  ]}

  DEFAULT_WORK_POSITION = -> {[
    find_and_pluck_by(WorkPosition, description: 'Auxiliar Logístico'),
    find_and_pluck_by(WorkPosition, description: 'Diseñador Gráfico'),
    find_and_pluck_by(WorkPosition, description: 'Mensajero'),
    find_and_pluck_by(WorkPosition, description: 'Community Manager'),
    find_and_pluck_by(WorkPosition, description: 'Auxiliar Contable')
  ]}

  DEFAULT_CONTRACT_TYPE = -> {[
    find_and_pluck_by(ContractType, description: "Término indefinido"),
    find_and_pluck_by(ContractType, description: "Prestación de servicios"),
    find_and_pluck_by(ContractType, description: "Temporal"),
    find_and_pluck_by(ContractType, description: "De aprendizaje")
  ]}

  DEFAULT_WORKING_DAYS = -> {[
    find_and_pluck_by(WorkingDay, description: "Mañana (7am-12pm)"),
    find_and_pluck_by(WorkingDay, description: "Tarde (12pm-5pm)"),
    find_and_pluck_by(WorkingDay, description: "Media tarde (5pm-10pm)"),
    find_and_pluck_by(WorkingDay, description: "Noche (10pm-3am)")
  ]}

  DEFAULT_SEARCH_PARAMS = {
    city: DEFAULT_CITIES,
    job_categories: DEFAULT_JOB_CATEGORIES,
    work_position: DEFAULT_WORK_POSITION,
    contract_type: DEFAULT_CONTRACT_TYPE,
    working_days: DEFAULT_WORKING_DAYS
  }

  def self.call
    DEFAULT_SEARCH_PARAMS.reduce({}) do |hash, (key, lambda)|
      hash.tap {|field| field[key] = lambda.().compact }
    end
  end

  private

  def self.find_and_pluck_by(model, **parameters)
    found = model.find_by(**parameters)

    found
      .attributes
      .deep_symbolize_keys
      .slice(:id, :description) if found.present?
  end


end