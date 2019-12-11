FactoryBot.define do
  factory :user do
    name                  { Faker::FunnyName.name }
    last_name             { Faker::FunnyName.two_word_name }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
    contact_number        { Faker::PhoneNumber.cell_phone }
    identification_number { Faker::IDNumber.valid }
    email                 { Faker::Internet.email }
    password              { Faker::Blockchain::Bitcoin.address }
    confirmed_at          { Date.today }
    nationalities         { [create(:nationality)] }
    vehicles              { [create(:vehicle)] }
    driving_licences      { [create(:driving_licence)] }
    sign_in_count         { 1323 }
    residence_city_id     { create(:city).id }
    born_city_id          { create(:city).id }

    association :sex, factory: :sex
    association :contract_type, factory: :contract_type
    association :document_type, factory: :document_type
    association :work_mode, factory: :work_mode
    association :city, factory: :city

    trait :first_time_candidate do
      document_type         { nil }
      name                  { nil }
      last_name             { nil }
      birthday              { nil }
      contact_number        { nil }
      identification_number { nil }
      nationalities         { [] }
      email                 { Faker::Internet.email }
      password              { Faker::Blockchain::Bitcoin.address }
      confirmed_at          { Date.today }
      sign_in_count         { 0 }
      city                  { nil }
      driving_licences      { [] }
      vehicles              { [] }
    end
  end
end
