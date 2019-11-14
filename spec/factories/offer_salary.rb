FactoryBot.define do
  factory :offer_salary do

    from { 1000000 }
    to   { from*rand(2..10) }

    association :currency, factory: :currency
    association :salary_period, factory: :salary_period
  end
end
