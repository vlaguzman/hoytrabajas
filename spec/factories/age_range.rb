FactoryBot.define do
  factory :age_range do
    from { 18 }
    to   { 35 }

    association :offer, factory: :offer
  end
end