FactoryBot.define do
  factory :offer do
    title                         { "Ruby on Rails developer with 10 years of experience" }
    address                       { Faker::Address.full_address }
    cellphone                     { Faker::PhoneNumber.cell_phone }
    description                   { "endSint esse anim consequat commodo." }
    vacancies_quantity            { 10 }
    close_date                    { Date.today + 1.month }
    immediate_start               { true }
    required_experience           { true }
    description_responsibilities  { "endSint esse anim consequat commodo." }
    release_date                  { Date.new }
    status                        { 'active' }

    trait :expired_offer do
      status                     { 'expired' }
    end

    after(:build) do |offer|
      offer.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'photo.jpg')), filename: 'photo.jpg', content_type: 'image/jpeg')
    end

    association :city, factory: :city
    association :job_category, factory: :job_category
    association :company, factory: :company
    association :sex, factory: :sex
    association :offer_type, factory: :offer_type
    association :work_mode, factory: :work_mode
    association :contract_type, factory: :contract_type
  end
end
