require 'rails_helper'

RSpec.describe "fill the canditate user data, studies and acknowledgments", :type => :feature do
  context "like a candidate user after the experience deta is filled" do

    #Create a user with the principal information, and the offert details - Use a factory
    let(:curriculum_vitae) { create(:curriculum_vitae, :empty) }
    let(:candidate) { curriculum_vitae.user }

    context "I dont have any study" do
      it "should show the studies fields and the next button",js: true do
        #Visit the rute of the profile user creation - step 9
        sign_in candidate

        visit users_wizards_step_nine_path

        expect(page).to have_text("Veamos tu formación académica")
        expect(page).to have_text("Título educativo*")
        expect(page).to have_text("Agregar otro estudio")

        has_button?("Saltar")

        click_on 'Saltar'

        expect(page).to have_text("Cuentas con reconocimientos")
      end

      it "should show the studies fields and the skip button", js: true do
        #Visit the rute of the profile user creation - step 9
        sign_in candidate

        visit users_wizards_step_nine_path

        expect(page).to have_text("Veamos tu formación académica")
        expect(page).to have_text("Título educativo*")
        expect(page).to have_text("Agregar otro estudio")

        has_button?("Saltar")

        click_on'Saltar'

        expect(page).to have_text("Cuentas con reconocimientos")

      end
    end

    context "I just have one study" do
      context "I dont fill the title" do
        #move if necesary to the main context
        before { create(:city, description: "Bogota").id }

        it "should return a error, and show me a message that says'the degree is a required field'", js: true do
          sign_in candidate

          visit users_wizards_step_nine_path

          expect(page).to have_text("Veamos tu formación académica")

          fill_in "user[curriculum_vitae][educational_level][institution_name]", :with => 'Sena'
          fill_in "user[curriculum_vitae][educational_level][start_date]", :with => '2017/01/01'

          find("span", text:"Estudio en curso").click

          find("div[id='mui-component-select-user[curriculum_vitae][educational_level][city_id]", visible: false).click
          find("li", text: "Bogota").click

          find("span", text: /SIGUIENTE/).click

          expect(page).to have_text("El Titulo Educativo no puede estar vacío")
        end
      end

      context "I fill all fields" do
        before { create(:city, description: "Bogota") }
        it "should show me the fields and save the data on click next button", js: true do
          sign_in candidate

          visit users_wizards_step_nine_path

          expect(page).to have_text("Veamos tu formación académica")

          fill_in "user[curriculum_vitae][educational_level][degree]", :with => 'Tecnico en cocina'
          fill_in "user[curriculum_vitae][educational_level][institution_name]", :with => 'Sena'
          fill_in "user[curriculum_vitae][educational_level][start_date]", :with => '2017/01/01'

          find("span", text:"Estudio en curso").click

          find("div[id='mui-component-select-user[curriculum_vitae][educational_level][city_id]", visible: false).click
          find("li", text: "Bogota").click

          #TODO add file from caybara is failing
          #attach_file("user[curriculum_vitae][educational_level][diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

          find("span", text: /SIGUIENTE/).click

          #You should validate the creation of the study in the DB

          expect(page).to have_text("Cuentas con reconocimientos")
        end
      end
    end

    context "I have more than one study" do
      before { create(:city, description: "Bogota") }

      it "should show me the fields and tsave the data on click next button in the DB", js: true do
        sign_in candidate

        visit users_wizards_step_nine_path

        expect(page).to have_text("Veamos tu formación académica")

        fill_in "user[curriculum_vitae][educational_level][degree]", :with => 'Tecnico en cocina'
        fill_in "user[curriculum_vitae][educational_level][institution_name]", :with => 'Sena'

        #fill_in "user[curriculum_vitae][educational_level][start_date]", :with => '2017/01/01'
        #fill_in "user[curriculum_vitae][educational_level][finish_date]", :with => ''

        find("span", text:"Estudio en curso").click

        find("div[id='mui-component-select-user[curriculum_vitae][educational_level][city_id]", visible: false).click
        find("li", text: "Bogota").click

        attach_file("user[curriculum_vitae][educational_level][diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

        #Here is necesary to test the upload of a file
        click_button 'Agregar otro estudio'

        expect(page).to have_text("Llevas 1 registro(s) de informacion academica")
        expect(page).to have_text("* Tecnico en cocina")

        fill_in "user[curriculum_vitae][educational_level][degree]", :with => 'Tecnico en sistemas'
        fill_in "user[curriculum_vitae][educational_level][institution_name]", :with => 'Sena'

        #TODO use capybara to set the date after november 1st
        #fill_in "user[curriculum_vitae][educational_level][start_date]", :with => '2016/01/01'
        #fill_in "user[curriculum_vitae][educational_level][finish_date]", :with => '2017/01/01'

        find("span", text:"Estudio en curso").click
        find("div[id='mui-component-select-user[curriculum_vitae][educational_level][city_id]", visible: false).click
        find("li", text: "Bogota").click

        find("span", text: /SIGUIENTE/).click

        #You should validate the creation of the study in the DB

        expect(page).to have_text("Cuentas con reconocimientos")
      end
    end

    context "after the studies data is filled" do
      context "I dont have any acknowledgment" do
        it "should show me the fields of acknowledgment information and the publish button", js: true do
          sign_in candidate

          visit users_wizards_step_ten_path

          expect(page).to have_text("Cuentas con reconocimientos")
          expect(page).to have_text("Título reconocimiento")
          expect(page).to have_text("Fecha De Inicio")
          expect(page).to have_text("Institución o entidad")
          has_button?("Publicar")

          click_on 'Publicar'

          expect(page).to have_text("Has creado un perfil ganador")
        end

        it "should show me the fields of acknowledgment information and the skip button", js: true do
          sign_in candidate

          visit users_wizards_step_ten_path

          expect(page).to have_text("Cuentas con reconocimientos")
          expect(page).to have_text("Título reconocimiento")
          expect(page).to have_text("Fecha De Inicio")
          expect(page).to have_text("Institución o entidad")
          has_button?("Saltar")
          click_on 'Saltar'

          expect(page).to have_text("Has creado un perfil ganador")
        end
      end

      context "I just have one acknowledgment" do
        it "should show me the fields of acknowledgment and save the data on click the publish button", js: true do
          sign_in candidate

          visit users_wizards_step_ten_path

          expect(page).to have_text("Cuentas con reconocimientos")

          fill_in "user[curriculum_vitae][acknowledgment][title]", :with => 'Tecnico en cocina'
          fill_in "user[curriculum_vitae][acknowledgment][entity_name]", :with => 'Sena'
          fill_in "user[curriculum_vitae][acknowledgment][start_date]", :with => '2017/01/01'

          #Here is necesary to test the upload of a file
          attach_file("user[curriculum_vitae][acknowledgment][diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

          click_button 'Publicar'

          #You should validate the creation of the acknowledgment in the DB
          expect(Acknowledgment.count).to eq(1)
          expect(page).to have_text("Has creado un perfil ganador")
        end
      end

      context "I have more than one acknowledgments" do
        it "should show me the fields of acknowledgment and save the data on click the publish button", js: true do
          sign_in candidate

          visit users_wizards_step_ten_path

          expect(page).to have_text("Cuentas con reconocimientos")

          fill_in "user[curriculum_vitae][acknowledgment][title]", :with => 'Premio a la puntualidad'
          fill_in "user[curriculum_vitae][acknowledgment][entity_name]", :with => 'Sena'
          fill_in "user[curriculum_vitae][acknowledgment][start_date]", :with => '2017/01/01'

          #Here is necesary to test the upload of a file
          attach_file("user[curriculum_vitae][acknowledgment][diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

          click_button 'Agregar otro reconocimiento'

          expect(page).to have_text("Cuentas con reconocimientos")
          expect(page).to have_text("Llevas 1 registro(s) de reconocimientos")
          expect(page).to have_text("* Premio a la puntualidad")

          fill_in "user[curriculum_vitae][acknowledgment][title]", :with => 'Medalla de oro cerveza IPA'
          fill_in "user[curriculum_vitae][acknowledgment][entity_name]", :with => 'Puerto Cervecero'
          fill_in "user[curriculum_vitae][acknowledgment][start_date]", :with => '2019/08/08'

          #Here is necesary to test the upload of a file
          attach_file("user[curriculum_vitae][acknowledgment][diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

          click_on 'Publicar'

          expect(Acknowledgment.count).to eq(2)

          expect(page).to have_text("Has creado un perfil ganador")
        end
      end
    end

  end
end
