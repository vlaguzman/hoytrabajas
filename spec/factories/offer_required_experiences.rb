FactoryBot.define do
  factory :offer_required_experiences do
    duration { 2 }

    association :offer, factory: :offer
    association :duration_type, factory: :duration_type
  end
end
