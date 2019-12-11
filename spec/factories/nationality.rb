FactoryBot.define do
  factory :nationality do
    description { Faker::Nation.nationality }
    country     { FactoryBot.create(:country) }
  end
end
