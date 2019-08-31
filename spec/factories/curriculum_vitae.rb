FactoryBot.define do
  factory :curriculum_vitae do
    area_code             { 90210 }
    about_me              { "Quis minim aliquip ea tempor reprehenderit voluptate." }
    release_date          { Date.new(2018, 01, 01) }
    travel_disponibility  { false }

    association :user,                 factory: :user
    association :city,                 factory: :city
    association :labor_disponibility,  factory: :labor_disponibility
    #association :limitations,          factory: :limitations
    #association :work_mode,            factory: :work_mode

    after(:build) do |curriculum|
      curriculum.photo.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'photo.jpg')), filename: 'photo.jpg', content_type: 'image/jpeg')
    end
  end
end