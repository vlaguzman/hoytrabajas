FactoryBot.define do
    factory :technical_skill do
      sequence(:description) { |n| "#{Faker::Job.key_skill}_#{n}" }
      create_by_admin { true }
  end
end