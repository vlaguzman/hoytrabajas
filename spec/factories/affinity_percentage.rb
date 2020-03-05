FactoryBot.define do
  factory :affinity_percentage do
    affinity_percentage { 0 }
    version { '1.0' }

    association :offer, factory: :offer
    association :curriculum_vitae, factory: :curriculum_vitae
  end
end
