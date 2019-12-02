FactoryBot.define do
  factory :curriculum_vitae_salary do
    from { 800000 }
    to   { 5000000 }

    association :curriculum_vitae,  factory: :curriculum_vitae
    association :salary_period,     factory: :salary_period
    association :currency,          factory: :currency
  end
end