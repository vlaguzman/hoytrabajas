
FactoryBot.define do
  factory :available_work_days_offers do

    association :available_work_day, factory: :available_work_days
    association :offer, factory: :offer
  end
end