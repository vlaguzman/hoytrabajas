FactoryBot.define do
  factory :sex do
    description { Faker::Gender.type }
  end
end
