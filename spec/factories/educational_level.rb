FactoryBot.define do
  factory :educational_level do
    institution_name { 'massachusetts institute of technology' }
    start_date       { Date.new }
    finish_date      { Date.new + 3.years }
    degree           { 'Software Engineer' }
    ongoing_study    { false }

    association :curriculum_vitae,  factory: :curriculum_vitae
    association :city,              factory: :city
  end
end