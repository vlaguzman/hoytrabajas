FactoryBot.define do
  factory :city do
    description { Faker::Nation.capital_city }

    association :state, factory: :state
  end
end
