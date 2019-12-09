FactoryBot.define do
  factory :nationality do
    description { Faker::Nation.nationality }
  end
end
