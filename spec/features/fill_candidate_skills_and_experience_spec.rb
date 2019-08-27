require 'rails_helper'

RSpec.describe "fill the canditate user data, skills and experience", :type => :feature do
  context "like a candidate user after the offert details data is filled" do
    #Create a user with the principal information, and the offert details - Use a factory
    before { FactoryBot.build(:user) }
    xit "should see the skills fields and the next button" do
      #Visit the rute of the profile user creation - step 6
      visit "/candidato/#{user.id}/create_user/step6" 
      
      expect(page).to have_text("Dejanos conocer tus habilidades")
      #it can be more than one option
      fill_in "soft_skills", :with => ['Creatividad', 'Responsabilidad']
      #it can be more than one option, each option is a hash 
      #id, skill_name, skill_category, skill_proficiency
      fill_in "technical_skills", :with => [[id: 1, skill_name: 'SEO', skill_category: 'Marketing', skill_proficiency: 'avanzado'],
                                            [id: 2, skill_name: 'SEM', skill_category: 'Marketing', skill_proficiency: 'medio']]
      fill_in "to_learn_skills", :with => [[id: 3, skill_name: 'Redes sociales', skill_category: 'Marketing'],
                                           [id: 4, skill_name: 'Google Analytics', skill_category: 'Marketing']]
      fill_in "language", :with => [[id: 1, language_name: 'Inglés', language_proficiency: 'avanzado'],
                                    [id: 2, language_name: 'Portugues', language_proficiency: 'básico']]
      click_button 'siguiente'
    end
    
    context "after the skills data is filled" do
      context "I dont have any experience" do
          xit "should show me the option to dont add any experience, I should click on it and see the message of the next secction" do
            #Visit the rute of the profile user creation - step 7
            visit "/candidato/#{user.id}/create_user/step7" 
            expect(page).to have_text("¿Cuentas con experiencia?")
            click_button 'No pero con disposición'
            
            expect(page).to have_text("Veamos tu información académica")
          end      
      end

      context "I want to add just one experience" do
          xit "should see the experience fields and the next buttons, click on it and see the message of the next secction" do
            #Visit the rute of the profile user creation - step 7
            visit "/candidato/#{user.id}/create_user/step7" 
            expect(page).to have_text("¿Cuentas con experiencia?")
            click_button 'Sí, quiero adicionarla'
            
            expect(page).to have_text("Cuentanos un poco de tu experiencia")
            page.select 'Marketing', from: 'job_category'
            fill_in "company", :with => 'HoyTrabajas.com'
            page.select 'Community manager', from: 'role'
            page.select 'Teletrabajo', from: 'work_methodology'
            page.select 'Bogota', from: 'job_city'
            page.select 'Suba', from: 'job_location'
            fill_in "started_at", :with => '2017/01/01'
            fill_in "finished_at", :with => nil
            check 'work_other_cities'
            fill_in "used_technical_skills", :with => ['Redes sociales', 'Photoshop']#it can be more than one option
            click_button 'siguiente'
            
            expect(page).to have_text("Veamos tu información académica")
            #IMPORTANT - Here you must validate the creation of the tables with the information filled by user
          end
      end 

      context "I want to add more than one experience" do
          xit "should see the experience fields and the button to add more experience, whend I click on it it should show me the resume and a new page to fill the information" do
            #Visit the rute of the profile user creation - step 7
            visit "/candidato/#{user.id}/create_user/step7" 
            expect(page).to have_text("¿Cuentas con experiencia?")
            click_button 'Sí, quiero adicionarla'
            
            expect(page).to have_text("Cuentanos un poco de tu experiencia")
            page.select 'Marketing', from: 'job_category'
            fill_in "company", :with => 'HoyTrabajas.com'
            page.select 'Community manager', from: 'role'
            page.select 'Teletrabajo', from: 'work_methodology'
            page.select 'Bogota', from: 'job_city'
            page.select 'Suba', from: 'job_location'
            fill_in "started_at", :with => '2017/01/01'
            fill_in "finished_at", :with => nil
            check 'still_in_progress'
            fill_in "used_technical_skills", :with => ['Redes sociales', 'Photoshop']#it can be more than one option
            click_button 'agregar otra experiencia'

            expect(page).to have_text("Marketing")
            expect(page).to have_text("HoyTrabajas")
            expect(page).to have_text("Community manager")

            #I have to wait at least 5 seconds
            sleep 5

            expect(page).to have_text("Cuentanos un poco de tu experiencia")
            page.select 'Marketing', from: 'job_category'
            fill_in "company", :with => 'Verde Logico'
            page.select 'Community manager', from: 'role'
            page.select 'Teletrabajo', from: 'work_methodology'
            page.select 'Bogota', from: 'job_city'
            page.select 'Suba', from: 'job_location'
            fill_in "started_at", :with => '2015/01/01'
            fill_in "finished_at", :with => '2016/12/13'
            fill_in "used_technical_skills", :with => ['Redes sociales', 'Photoshop']#it can be more than one option
            click_button 'agregar otra experiencia'

            click_button 'siguiente'
            
            expect(page).to have_text("Veamos tu información académica")
            #IMPORTANT - Here you must validate the creation of the tables with the information filled by user
      end 
    end
  end
end