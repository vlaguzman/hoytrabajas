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

    association :employees_range, factory: :employees_range

    after(:build) do |company|
      company.logo.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'photo.jpg')), filename: 'photo.jpg', content_type: 'image/jpeg')
    end
  end
end
