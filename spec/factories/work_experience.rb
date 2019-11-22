
FactoryBot.define do
  factory :work_experience do
    started_at          { Date.today }
    finished_at         { Date.today + 3.years }
    company_name        { Faker::Company.name }
    still_in_progress   { false }

    association :job_category, factory: :job_category
    association :work_methodology, factory: :work_methodology
    association :contract_type, factory: :contract_type
    association :curriculum_vitae, factory: :curriculum_vitae
    association :work_position, factory: :work_position
    association :city, factory: :city
  end
end
