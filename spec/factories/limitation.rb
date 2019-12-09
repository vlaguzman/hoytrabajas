FactoryBot.define do
  factory :limitation do
    description { Faker::Games::Pokemon.move }
  end
end