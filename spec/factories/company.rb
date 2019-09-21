FactoryBot.define do
  factory :company do
    name                  { "Cemellas Today SA" }
    contact_name          { "Alfred Fakeman" }
    cellphone             { "3004005050" }
    contact_cellphone     { "3004005051" }
    nit                   { "901500600-9" }
    address               { "Calle False 112 # 45-80" }
    email                 { "contact@hoycamellas.com" }
    web_site              { "hoycamellas.com" }
    contact_web_site      { "hoycamellas.com/contact" }
    description           { "Occaecat elit reprehenderit proident aliquip anim ex aute aliquip mollit exercitation qui." }
    contact_work_position { "Human Resources Talent Hunter" }
    sign_in_count         { 34565 }

    after(:build) do |company|
      company.logo.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'photo.jpg')), filename: 'photo.jpg', content_type: 'image/jpeg')
    end

    trait :first_time do
      name                  { nil }
      contact_name          { nil }
      cellphone             { nil }
      contact_cellphone     { nil }
      nit                   { nil }
      address               { nil }
      email                 { Faker::Internet.email }
      passsword             { Faker::Blockchain::Bitcoin.address }
      confirmed_at          { Date.today }
      sign_in_count         { 0 }
      web_site              { nil }
      contact_web_site      { nil }
      description           { nil }
      contact_work_position { nil }
    end
  end
end
