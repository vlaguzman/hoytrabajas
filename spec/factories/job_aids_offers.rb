FactoryBot.define do
  factory :job_aids_offers do

    association :offer, factory: :offer
    association :job_aid, factory: :job_aid
  end
end
