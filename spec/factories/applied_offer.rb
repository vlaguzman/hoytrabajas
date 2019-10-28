FactoryBot.define do
  factory :applied_offer do
    applied_date                  { Date.new }

    association :offer, factory: :offer
    association :curriculum_vitae, factory: :curriculum_vitae
    association :applied_offer_status, factory: :applied_offer_status
  end
end
