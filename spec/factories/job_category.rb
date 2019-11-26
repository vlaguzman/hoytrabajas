FactoryBot.define do
  factory :job_category do
    description { Faker::Commerce.department }
  end
end
