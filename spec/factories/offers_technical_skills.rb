FactoryBot.define do
  factory :offers_technical_skills do

    association :technical_skill, factory: :technical_skill
    association :level, factory: :level
  end
end
