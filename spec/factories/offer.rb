FactoryBot.define do
  factory :offer do

    title                         { Faker::Lorem.sentence(word_count: 8) }
    address                       { Faker::Address.full_address }
    cellphone                     { Faker::PhoneNumber.cell_phone }
    description                   { "endSint esse anim consequat commodo." }
    close_date                    { Date.today + 1.month }
    immediate_start               { false }
    required_experience           { true }
    description_responsibilities  { "endSint esse anim consequat commodo." }
    release_date                  { Date.new }
    status                        { 'active' }
    job_categories                { [FactoryBot.create(:job_category)] }
    vacancies_quantity            { 10 }

    trait :expired_offer do
      status                       { 'expired' }
    end

    trait :immediate_start_offer do
      immediate_start              { true }
    end

    trait :no_required_experience_offer do
      required_experience           { false }
    end

    after(:build) do |offer|
      offer.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'photo.jpg')), filename: 'photo.jpg', content_type: 'image/jpeg')
    end

    association :company, factory: :company
    association :city, factory: :city
  end
end
