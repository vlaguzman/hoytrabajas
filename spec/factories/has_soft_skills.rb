FactoryBot.define do
  factory :has_soft_skill do
    association :curriculum_vitae, factory: :curriculum_vitae
    association :soft_skill,       factory: :soft_skill
  end
end
