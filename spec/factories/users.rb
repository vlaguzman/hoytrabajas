FactoryBot.define do
  factory :user do
    email { 'nuevousuario@gmail.com' } 
    password { 'hola12345' }
    password_confirmation { 'hola12345' }
    sign_in_count { 0 }
    confirmed_at { Date.today } 
  end
end
