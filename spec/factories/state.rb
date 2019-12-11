FactoryBot.define do
  factory :state do
    description { Faker::Nation.capital_city }

    association :country, factory: :country
  end
end
