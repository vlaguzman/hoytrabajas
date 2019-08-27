FactoryBot.define do
  factory :curriculum_vitae do
    area_code             { 90210 }
    cellphone_number      { "5003002020" }
    identification_number { "1000203098" }
    tell_us               { "Quis minim aliquip ea tempor reprehenderit voluptate." }
    release_date          { Date.new(2018, 01, 01) }
    travel_disponibility  { false }

    association :user,                  factory: :user
    association :city,                  factory: :city
    association :nationality,           factory: :nationality
    association :labor_disponibility,   factory: :labor_disponibility
    association :document_type,         factory: :document_type
    association :handicap,              factory: :handicap
    association :gender,                factory: :gender
    association :work_type,             factory: :work_type
    association :contract_type,         factory: :contract_type
  end
end

