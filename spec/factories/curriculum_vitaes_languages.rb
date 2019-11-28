FactoryBot.define do
  factory :curriculum_vitaes_languages do
    association :curriculum_vitae,  factory: :curriculum_vitae
    association :language,          factory: :language
    association :level,             factory: :level
  end
end