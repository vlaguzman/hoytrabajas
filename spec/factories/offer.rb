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
    
    trait :empty do
      title                         { Faker::Lorem.sentence(word_count: 8) }
      address                       { nil }
      cellphone                     { nil }
      description                   { nil }
      close_date                    { nil }
      immediate_start               { nil }
      required_experience           { nil }
      description_responsibilities  { nil }
      release_date                  { nil }
      status                        { nil }
      city                          { nil }
      contract_type                 { nil }
      work_mode                     { nil }
      vacancies_quantity            { nil }
    end
    
    trait :with_relations_offer do
      working_days                  { [FactoryBot.create(:working_day)] }
      available_work_days           { [FactoryBot.create(:available_work_day)] }
      technical_skills              { [FactoryBot.create(:technical_skill)] }
      soft_skills                   { [FactoryBot.create(:soft_skill)] }
      job_categories                { [FactoryBot.create(:job_category)] }
    end

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
    association :work_mode, factory: :work_mode
    association :contract_type, factory: :contract_type
    
    factory :empty_offer, traits: [:empty]
  end
end
