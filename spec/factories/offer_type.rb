FactoryBot.define do
  factory :offer_type do
    description { Faker::Job.employment_type }
  end
end
