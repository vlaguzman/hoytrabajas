FactoryBot.define do
  factory :offers_working_days do

    association :offer, factory: :offer
    association :working_day, factory: :working_day
  end
end
