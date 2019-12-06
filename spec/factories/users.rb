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
    sign_in_count         { 1323 }

    association :sex, factory: :sex
    association :contract_type, factory: :contract_type
    association :document_type, factory: :document_type
    association :work_mode, factory: :work_mode

    trait :first_time_candidate do
      document_type         { nil }
      name                  { nil }
      last_name             { nil }
      birthday              { nil }
      contact_number        { nil }
      identification_number { nil }
      email                 { Faker::Internet.email }
      password              { Faker::Blockchain::Bitcoin.address }
      confirmed_at          { Date.today }
      sign_in_count         { 0 }
    end
  end
end
