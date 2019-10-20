FactoryBot.define do
  factory :offers_work_positions do

    association :offer, factory: :offer
    association :work_position, factory: :work_position
  end
end
