FactoryBot.define do
  factory :nationality do
    description { Faker::Nation.nationality }

    association :country, factory: :country
  end
end
