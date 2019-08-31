FactoryBot.define do
  factory :required_experience do
    duration { 2 }

    association :offer, factory: :offer
    association :duration_type, factory: :duration_type
  end
end