FactoryBot.define do
  factory :language do
    description { "#{Faker::ProgrammingLanguage.name}ish" }
  end
end
