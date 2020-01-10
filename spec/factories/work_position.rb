FactoryBot.define do
  factory :work_position do
    sequence(:description) { |n| "#{Faker::Games::ElderScrolls.creature}_#{n}" }

  end
end