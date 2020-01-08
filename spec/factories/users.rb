FactoryBot.define do
  factory :user do
    name                  { Faker::FunnyName.name }
    last_name             { Faker::FunnyName.two_word_name }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
    contact_number        { 3113535522 }
    identification_number { Faker::IDNumber.valid }
    email                 { Faker::Internet.email }
    password              { Faker::Blockchain::Bitcoin.address }
    confirmed_at          { Date.today }
    nationalities         { [create(:nationality)] }
    born_city_id          { create(:city).id }
    residence_city_id     { create(:city).id }
    vehicles              { [create(:vehicle)] }
    driving_licences      { [create(:driving_licence)] }
    sign_in_count         { 1323 }

    association :contract_type, factory: :contract_type
    association :work_mode, factory: :work_mode
    association :city, factory: :city
    association :sex, factory: :sex
    association :educational_degree, factory: :educational_degree

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
      contract_type         { nil }
      work_mode             { nil }
      sex                   { nil }
      educational_degree    { nil }
      driving_licences      { [] }
      born_city_id          { nil }
      residence_city_id     { nil }
      vehicles              { [] }
    end

    association :document_type, factory: :document_type

    factory :with_associations_user, traits: [:with_associations]
  end
end
