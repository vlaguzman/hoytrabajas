FactoryBot.define do
  factory :curriculum_vitaes_technical_skills do
    step_up  { false }

    association :curriculum_vitae,  factory: :curriculum_vitae
    association :technical_skill,   factory: :technical_skill
    association :job_category,      factory: :job_category
    association :level,             factory: :level
  end
end