FactoryBot.define do
  factory :state do
    description { Faker::Nation.capital_city }
  end
end
