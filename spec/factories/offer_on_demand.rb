FactoryBot.define do
  factory :offer_on_demand do

    status    { 'up' }
    start_at  { Date.today }
    finish_at { Date.today + 15.days }

    association :offer, factory: :offer
  end
end
