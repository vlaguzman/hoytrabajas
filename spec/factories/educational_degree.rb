FactoryBot.define do
  factory :educational_degree do
    description { Faker::Military.army_rank }
  end
end