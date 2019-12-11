FactoryBot.define do
  factory :country do
    description { Faker::Nation.nationality }
  end
end
