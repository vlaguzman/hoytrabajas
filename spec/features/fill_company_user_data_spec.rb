require 'rails_helper'

RSpec.describe "fill the principal company user data", :type => :feature do
# context "like a company user is his first login" do
#   #Create a user with the principal information - Use a factory
#   before { FactoryBot.build(:company) }

#   context "I dont fill the name of the company" do
#     xit "should see a message that sais me this field is required" do
#       #Visit the rute of the company profile creation - step 1
#       visit "/empresa/#{user.id}/create_user/step1"

#       expect(page).to have_text("Empecemos por conocernos")
#       expect(page).to have_text("Nombre empresa")
#       page.select 'Textiles', from: 'industry'
#       click_button 'siguiente'

#       expect(page).to have_text("El nombre de la empresa es un campo requerido")
#     end
#   end

#   context "I dont fill the industry of the company" do
#     xit "should see a message that sais me this field is required" do
#       #Visit the rute of the company profile creation - step 1
#       visit "/empresa/#{user.id}/create_user/step1"

#       expect(page).to have_text("Empecemos por conocernos")
#       fill_in "company_name", :with => 'HoyTrabajas.com'
#       expect(page).to have_text("Sector al que pertenece tu empresa")
#       click_button 'siguiente'
# 
#       expect(page).to have_text("El sector de la empresa es un campo requerido")
#     end 
#   end

#   context "I fill all data" do
#     xit "should see the field to fill my principal info and save it with the next button" do
#       #Visit the rute of the company profile creation - step 1
#       visit "/empresa/#{user.id}/create_user/step1"

#       expect(page).to have_text("Empecemos por conocernos")
#       fill_in "company_name", :with => 'HoyTrabajas.com'
#       page.select 'Empleo', from: 'industry'  
#       fill_in "contact_name", :with => 'Ruben Cordoba'
#       fill_in "role", :with => 'CEO'
#       fill_in "phone_number", :with => '3101234567'
#       page.select '1 - 10', from: 'number_of_employees' 
#       
#       click_button 'siguiente'

#       #Validate the creation of the company in the DB
#       
#       expect(page).to have_text("Describe brevemente tu compañía")
#     end
#   end
#  
#   context "I already fill the principal info, and i am in the second page" do
#     context "I fill the description field" do
#       xit "should see the description field and the systems should save in the DB on click the next button" do
#         #Visit the rute of the company profile creation - step 2
#         visit "/empresa/#{user.id}/create_user/step2"

#         expect(page).to have_text("Describe brevemente tu compañía")
#         fill_in "company_abstract", :with => 'Te ayudamos a encontrar el empleo que mejor se adapta a ti.'

#         click_button 'siguiente'
#         #Validate the creation of the company in the DB
#         
#         expect(page).to have_text("Creemos tu primera oferta")
#       end
#     end

#     context "I dont fill the description field" do
#       xit "should show me the next form with the next button" do 
#         #Visit the rute of the company profile creation - step 2
#         visit "/empresa/#{user.id}/create_user/step2"

#         expect(page).to have_text("Describe brevemente tu compañía")

#         click_button 'siguiente'
#   
#         expect(page).to have_text("Creemos tu primera oferta")
#       end
#     end
#   end
# end
end 
