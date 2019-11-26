FactoryBot.define do
  factory :level do
    sequence(:description) { |n| "level_#{n}" }
  end
end