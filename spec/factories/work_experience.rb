FactoryBot.define do
  factory :work_experience do
    started_at          { Date.today }
    finished_at         { Date.today + 3.years }
    company_name        { Faker::Company.name }
    still_in_progress   { false }
    technical_skills   { create_list(:technical_skill, 3) }

    association :job_category, factory: :job_category
    association :work_methodology, factory: :work_methodology
    association :contract_type, factory: :contract_type
    association :curriculum_vitae, factory: :curriculum_vitae
    association :work_position, factory: :work_position
    association :city, factory: :city
  end

  trait :empty do
    started_at          { nil }
    finished_at         { nil }
    company_name        { nil }
    still_in_progress   { nil }
    technical_skills    { [] }
    city                { nil }
    work_methodology    { nil }
    contract_type       { nil }
  end
end
