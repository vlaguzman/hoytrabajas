FactoryBot.define do
  factory :educational_level do
    institution_name { 'massachusetts institute of technology' }
    start_date       { Date.new }
    finish_date      { Date.new + 3.years }
    degree           { 'Software Engineer' }
    ongoing_study    { false }

    association :curriculum_vitae,  factory: :curriculum_vitae
    association :city,              factory: :city

    after(:build) do |educational_level|
      educational_level.diploma.attach(io: File.open(Rails.root.join('spec', 'factories', 'pdfs', 'diploma.pdf')), filename: 'diploma.pdf')
    end

    trait :empty do
      start_date       { nil }
      finish_date      { nil }
      degree           { nil }
      ongoing_study    { nil }
      city             { nil }
      diploma          { nil }
    end
  end
end