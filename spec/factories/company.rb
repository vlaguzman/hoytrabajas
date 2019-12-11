FactoryBot.define do
  factory :company do
    name                  { Faker::Company.name }
    contact_name          { Faker::FunnyName.name  }
    cellphone             { Faker::PhoneNumber.cell_phone }
    contact_cellphone     { Faker::PhoneNumber.cell_phone }
    nit                   { "901500600-9" }
    address               { Faker::Address.full_address }
    email                 { Faker::Internet.email}
    web_site              { "hoycamellas.com" }
    contact_web_site      { "hoycamellas.com/contact" }
    description           { "Occaecat elit reprehenderit proident aliquip anim ex aute aliquip mollit exercitation qui." }
    contact_work_position { "Human Resources Talent Hunter" }
    sign_in_count         { 34565 }
    password              { Faker::Blockchain::Bitcoin.address }
    confirmed_at          { Date.today }

    trait :with_logo do
      after(:build) do |company|
        company.logo.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'photo.jpg')), filename: 'photo.jpg', content_type: 'image/jpeg')
      end
    end

    trait :first_time do
      name                  { nil }
      contact_name          { nil }
      cellphone             { nil }
      contact_cellphone     { nil }
      nit                   { nil }
      address               { nil }
      email                 { Faker::Internet.email }
      password              { Faker::Blockchain::Bitcoin.address }
      confirmed_at          { Date.today }
      sign_in_count         { 0 }
      web_site              { nil }
      contact_web_site      { nil }
      description           { nil }
      contact_work_position { nil }
    end

    association :city, factory: :city
    association :employees_range, factory: :employees_range

    factory :with_logo_company, traits: [:with_logo]
  end
end
