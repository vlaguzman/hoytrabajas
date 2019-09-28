FactoryBot.define do
  factory :languages_offers do

    association :offer, factory: :offer
    association :language, factory: :language
    association :level, factory: :level
  end
end
