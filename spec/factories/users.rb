FactoryBot.define do
  factory :user do
    email { 'nuevousuario@gmail.com' } 
    password { 'hola12345' }
    password_confirmation { 'hola12345' }
    sign_in_count { 0 }
    confirmed_at { Date.today } 

    #first form 
    #name { "Carlos" }
    #last_name { "Rojas" }
    #nationality { nil }
    #document_type { nil }
    #identification_number { nil }
    #about_me { "I am the best chef in the world" }
    #sexuality { nil }
    #birthday { Date.new(1990-01-01) }
    #handicap { nil }
    #educational_degree { nil }
  end
end
