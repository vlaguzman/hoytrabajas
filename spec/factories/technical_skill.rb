FactoryBot.define do
    factory :technical_skill do
      description { Faker::Job.key_skill }
  end
end