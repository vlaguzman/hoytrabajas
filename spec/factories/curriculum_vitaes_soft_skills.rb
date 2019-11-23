FactoryBot.define do
  factory :curriculum_vitaes_soft_skills do
    curriculum_vitae  { create(:curriculum_vitae) }
    soft_skill        { create(:soft_skill) }
  end
end