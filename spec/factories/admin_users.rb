FactoryBot.define do
  factory :admin_user do
    email                 { Faker::Internet.email}
    password              { Faker::Blockchain::Bitcoin.address }
  end
end
