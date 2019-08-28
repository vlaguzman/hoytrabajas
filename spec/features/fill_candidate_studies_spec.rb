require 'rails_helper'

RSpec.describe "fill the canditate user data, studies and acknowledgments", :type => :feature do
  context "like a candidate user after the experience deta is filled" do
    #Create a user with the principal information, and the offert details - Use a factory
    before { FactoryBot.build(:user) }
    
    context "I dont have any study" do
      xit "should show the studies fields and the next button" do
        #Visit the rute of the profile user creation - step 9
        visit "/candidato/#{user.id}/create_user/step9"

        expect(page).to have_text("veamos tu formación académica")
        expect(page).to have_text("titulo educativo")
        expect(page).to have_text("agregar otro estudio")
        expect(page).to have_text("siguiente")
        click_button 'siguiente'

        expect(page).to have_text("Cuentas con reconocimientos")
      end

      xit "should show the studies fields and the skip button" do
        #Visit the rute of the profile user creation - step 9
        visit "/candidato/#{user.id}/create_user/step9"

        expect(page).to have_text("veamos tu formación académica")
        expect(page).to have_text("titulo educativo")
        expect(page).to have_text("agregar otro estudio")
        expect(page).to have_text("saltar")
        click_button 'saltar'

        expect(page).to have_text("Cuentas con reconocimientos")
      end
    end
    
    context "I just have one study" do
      xit "should show me the fields and save the data on next button in the DB" do
        visit "/candidato/#{user.id}/create_user/step9" 

        expect(page).to have_text("veamos tu formación académica")
        fill_in "title", :with => 'Tecnico en cocina'
        fill_in "school", :with => 'Sena'
        fill_in "started_at", :with => '2017/01/01'
        fill_in "finished_at", :with => ''
        check 'still_in_progress'
        fill_in "location", :with => 'Bogota'
        #Here is necesary to test the upload of a file
        find('form input[type="file"]').set('path/to/file.csv')
        click_button 'siguiente'

        #You should validate the creation of the study in the DB

        expect(page).to have_text("Cuentas con reconocimientos")
      end   
    end
    
    context "I have more than one study" do
      xit "should show me the fields and tsave the data on click next button in the DB" do
        visit "/candidato/#{user.id}/create_user/step9"

        expect(page).to have_text("veamos tu formación académica")
        fill_in "title", :with => 'Tecnico en cocina'
        fill_in "school", :with => 'Sena'
        fill_in "started_at", :with => '2017/01/01'
        fill_in "finished_at", :with => ''
        check 'still_in_progress'
        fill_in "location", :with => 'Bogota'
        #Here is necesary to test the upload of a file
        find('form input[type="file"]').set('path/to/file.csv')
        click_button 'agregar otro estudio'

        fill_in "title", :with => 'Tecnico en sistemas'
        fill_in "school", :with => 'Sena'
        fill_in "started_at", :with => '2016/01/01'
        fill_in "finished_at", :with => '2017/01/01'
        fill_in "location", :with => 'Bogota'
        click_button 'siguiente'

        #You should validate the creation of the study in the DB

        expect(page).to have_text("Cuentas con reconocimientos")    
      end   
    end

    context "after the studies data is filled" do
      context "I dont have any acknowledgment" do
        xit "should show me the fields of acknowledgment information and the publish button" do
          #Visit the rute of the profile user creation - step 10
          visit "/candidato/#{user.id}/create_user/step10"

          expect(page).to have_text("Cuentas con reconocimientos")
          expect(page).to have_text("titulo reconocimiento")
          expect(page).to have_text("fecha de inicio")
          expect(page).to have_text("institucion o entidad")
          expect(page).to have_text("publicar")
          click_button 'publicar'

          expect(page).to have_text("Has creado un perfil ganador")
        end
        
        xit "should show me the fields of acknowledgment information and the skip button" do
          #Visit the rute of the profile user creation - step 10
          visit "/candidato/#{user.id}/create_user/step10"

          expect(page).to have_text("Cuentas con reconocimientos")
          expect(page).to have_text("titulo reconocimiento")
          expect(page).to have_text("fecha de inicio")
          expect(page).to have_text("institucion o entidad")
          expect(page).to have_text("saltar")
          click_button 'saltar'

          expect(page).to have_text("Has creado un perfil ganador")
        end
      end
      
      context "I just have one acknowledgment" do
        xit "should show me the fields of acknowledgment and save the data on click the publish button" do
          visit "/candidato/#{user.id}/create_user/step10"

          expect(page).to have_text("Cuentas con reconocimientos")
          fill_in "title", :with => 'Tecnico en cocina'
          fill_in "institution", :with => 'Sena'
          fill_in "date", :with => '2017/01/01'
          #Here is necesary to test the upload of a file
          find('form input[type="file"]').set('path/to/file.csv')
          click_button 'publicar'

          #You should validate the creation of the acknowledgment in the DB

          expect(page).to have_text("Has creado un perfil ganador")
        end
      end
      
      context "I have more than one acknowledgments" do
        xit "should show me the fields of acknowledgment and save the data on click the publish button" do
          visit "/candidato/#{user.id}/create_user/step10"

          xpect(page).to have_text("Cuentas con reconocimientos")
          fill_in "title", :with => 'Premio a la puntualidad'
          fill_in "institution", :with => 'Sena'
          fill_in "date", :with => '2017/01/01'
          #Here is necesary to test the upload of a file
          find('form input[type="file"]').set('path/to/file.csv')
          click_button 'agregar otro reconocimiento'

          fill_in "title", :with => 'Medalla de oro cerveza IPA'
          fill_in "institution", :with => 'Puerto Cervecero'
          fill_in "date", :with => '2019/08/08'
          #Here is necesary to test the upload of a file
          find('form input[type="file"]').set('path/to/file.csv')
          click_button 'publicar'

          #You should validate the creation of the acknowledgment in the DB
          
          expect(page).to have_text("Has creado un perfil ganador")
        end
      end
    end

  end
end
