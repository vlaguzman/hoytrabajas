FactoryBot.define do
  factory :acknowledgment do
    title        { "acknowledgment by code durin 480 hours in a row" }
    start_date   { Date.new }
    entity_name  { "Unit Developers Corp" }

    association :curriculum_vitae, factory: :curriculum_vitae
  end

end