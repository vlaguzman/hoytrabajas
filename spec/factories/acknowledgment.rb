FactoryBot.define do
  factory :acknowledgment do
    title        { "acknowledgment by code durin 480 hours in a row" }
    start_date   { Date.today }
    entity_name  { "Unit Developers Corp" }

    association :curriculum_vitae, factory: :curriculum_vitae
    association :city, factory: :city

    trait :empty do
      title        { nil }
      start_date   { nil }
      entity_name  { nil }
      city         { nil }
    end
  end

end