
FactoryBot.define do
  factory :work_experience do
    started_at           { Date.today }
    finished_at         {  }
    company_name        {  }
    still_in_progress   {  }

    association :job_category, factory: :job_category
    association :work_methodology, factory: :work_methodology
    association :contract_type, factory: :contract_type
    association :curriculum_vitae, factory: :curriculum_vitae
    association :work_position, factory: :work_position
  end
end
