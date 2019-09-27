FactoryBot.define do
  factory :offers_salaries do

    from { 1000000 }
    to   { from*rand(2..10) }

    association :offer, factory: :offer
    association :currency, factory: :currency
    association :salary_type, factory: :salary_type
    association :salary_period, factory: :salary_period
  end
end