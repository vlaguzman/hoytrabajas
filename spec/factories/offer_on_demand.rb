FactoryBot.define do
  factory :offer_on_demand do

    status    { 'up' }
    start_at  { Date.today }
    finish_at { Date.today + 15.days }

    association :offer, factory: :offer

    trait :empty do
      start_at  { nil }
      finish_at { nil }
    end
  end
end
