FactoryBot.define do
  factory :offer do
    title                         { "Ruby on Rails developer with 10 years of experience" }
    address                       { "Fake Street 123 # 99 - 01" }
    cellphone                     { "3002004050" }
    description                   { "endSint esse anim consequat commodo." }
    vacancies_quantity            { 10 }
    close_date                    { Date.new + 1.month }
    immediate_start               { true }
    required_experience           { true }
    description_responsibilities  { "endSint esse anim consequat commodo." }
    release_date                  { Date.new }
    status                        { "published" }
  end
end
