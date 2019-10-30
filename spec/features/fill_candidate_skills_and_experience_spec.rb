require 'rails_helper'

RSpec.describe "fill the canditate user data, skills and experience", :type => :feature do
  context "like a candidate user after the offert details data is filled" do
    #Create a user with the principal information, and the offert details - Use a factory
    let!(:soft_skills) do
      [
        create(:soft_skill, description: "Creatividad"),
        create(:soft_skill, description: "Responsabilidad")
      ]
    end

    let!(:job_categories) do
      [
        create(:job_category, description: "Marketing"),
        create(:job_category, description: "Desarrollo de Software"),
      ]
    end

    let!(:technical_skills) do
      [
        create(:technical_skill, description: "SEO"),
        create(:technical_skill, description: "Redes sociales"),
      ]
    end

    let!(:languages) do
      [
        create(:language, description: "Parsel"),
        create(:language, description: "Inglés"),
      ]
    end

    let!(:levels) do
      [
        create(:level, description: "medio"),
        create(:level, description: "avanzado"),
      ]
    end

    let!(:job_category_id) do
      [
        create(:job_category, description: "Mecanic").id
      ]
    end

    let!(:work_position_id) do
      [
        create(:work_position, description: "Community manager").id
      ]
    end

    let!(:work_methodology_id) do
      [
        create(:work_methodology, description: "Teletrabajo").id
      ]
    end

    let!(:city_id) do
      [
        create(:city, description: "Bogota").id
      ]
    end

    let!(:technical_skill_ids) do
      [
        create(:technical_skill, description: "Redes Sociales").id,
        create(:technical_skill, description: "Photoshop").id,
      ]
    end

    let(:curriculum) { create( :curriculum_vitae, user: create(:user, :first_time_candidate)) }

    context "after the skills data is filled" do
      context "I dont have any experience" do
        it "should show me the option to dont add any experience, I should click on it and see the message of the next secction", js: true do
          sign_in curriculum.user

          #Visit the rute of the profile user creation - step 7
          visit users_wizards_step_seven_path

          expect(page).to have_text(/¿Cuentas con experiencia?/)

          click_on 'No pero con disposición'

          expect(page).to have_text(/Veamos tu formación académica/)
        end
      end

      context "I want to add just one experience" do
        context "I fill all data in the form" do
          it "should see the experience fields and the next buttons, click on it and see the message of the next secction", js: true do
            #Visit the rute of the profile user creation - step 7
            sign_in curriculum.user

            visit users_wizards_step_seven_path

            expect(page).to have_text(/¿Cuentas con experiencia?/)

            click_button('Si, quiero adicionarla')

            expect(page).to have_text(/Cuentanos un poco de tu experiencia/)

            find("div[id='select-user[curriculum_vitae][work_experience][job_category_id]']", visible: false).click
            find("li", text: "Marketing").click

            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'HoyTrabajas.com'

            find("div[id='select-user[curriculum_vitae][work_experience][work_position_id]']", visible: false).click
            find("li", text: "Community manager").click

            find("div[id='select-user[curriculum_vitae][work_experience][work_methodology_id]']", visible: false).click
            find("li", text: "Teletrabajo").click

            find("div[id='select-user[curriculum_vitae][work_experience][city_id]']", visible: false).click
            find("li", text: "Bogota").click

            #TODO Uncomment when the we implement 'localidades'
            #page.select 'Bogota', from: 'user[curriculum_vitae][work_experience][location_id]'

            #TODO build a way to use easly the datepicker with capybara
            #fill_in "user[curriculum_vitae][work_experience][started_at]", :with => '2017/01/01'
            #fill_in "user[curriculum_vitae][work_experience][finished_at]", :with => nil

            #TODO find the way to check the boolean with capybara
            #check 'user[curriculum_vitae][work_experience][still_in_progress]'

            find("div[id='select-user[curriculum_vitae][work_experience][technical_skill_ids][]']", visible: false).click
            find("li", text: "Redes sociales").click

            find("div[id='select-user[curriculum_vitae][work_experience][technical_skill_ids][]']", visible: false).click
            find("li", text: "Photoshop").click

            find("span", text: /SIGUIENTE/).click

            #IMPORTANT - Here you must validate the creation of the tables with the information filled by user

            expect(page).to have_text("Veamos tu formación académica")
          end
        end

        context "I dont fill the job_category" do
          it "should see a message that said me 'you must fill the job_category'", js: true do
            #Visit the rute of the profile user creation - step 8
            sign_in curriculum.user

            visit users_wizards_step_eight_path

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            find("div[id='select-user[curriculum_vitae][work_experience][work_position_id]']", visible: false).click
            find("li", text: "Community manager").click

            execute_script "window.scrollTo(0, (window.innerHeight * 2) )"

            find("span", text: /SIGUIENTE/).click
            #click_button 'siguiente'
            #byebug

            expect(page).to have_text("Debes seleccionar un Categoria de Trabajo")
          end
        end

        context "I dont fill the role" do
          it "should see a message that said me 'you must fill the role'", js: true do
            #Visit the rute of the profile user creation - step 7
            sign_in curriculum.user

            visit users_wizards_step_eight_path

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            find("div[id='select-user[curriculum_vitae][work_experience][job_category_id]']", visible: false).click
            find("li", text: "Marketing").click

            find("span", text: /SIGUIENTE/).click

            #TODO add i18n traslations
            #expect(pag e).to have_text("El role es un campo requerido")

            expect(page).to have_text("Debes seleccionar un Cargo")
          end
        end
      end

      context "I want to add more than one experience" do
        it "should see the experience fields and the button to add more experience", js: true do
          sign_in curriculum.user

          visit users_wizards_step_seven_path

          expect(page).to have_text("¿Cuentas con experiencia?")

          click_on 'Si, quiero adicionarla'

          expect(page).to have_button('Agregar otra experiencia')
        end

        context "when I click on 'Agregar otra experiencia'" do
          it "should show me the resume and a new page to fill the information", js: true do
            #Visit the rute of the profile user creation - step 7
            sign_in curriculum.user

            visit users_wizards_step_seven_path

            expect(page).to have_text("¿Cuentas con experiencia?")

            click_on 'Si, quiero adicionarla'

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            find("div[id='select-user[curriculum_vitae][work_experience][job_category_id]", visible: false).click
            find("li", text: "Marketing").click

            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'HoyTrabajas.com'

            find("div[id='select-user[curriculum_vitae][work_experience][work_position_id]", visible: false).click
            find("li", text: "Community manager").click

            find("div[id='select-user[curriculum_vitae][work_experience][work_methodology_id]", visible: false).click
            find("li", text: "Teletrabajo").click

            find("div[id='select-user[curriculum_vitae][work_experience][city_id]", visible: false).click
            find("li", text: "Bogota").click

            #TODO  field 'localidad' is pending
            #page.select 'Suba', from: 'job_location'

            #fill_in "user[curriculum_vitae][work_experience][started_at]", :with => '2017/01/01'
            #fill_in "user[curriculum_vitae][work_experience][finished_at]", :with => nil

            #check 'user[curriculum_vitae][work_experience][still_in_progress]'
            find("div[id='select-user[curriculum_vitae][work_experience][technical_skill_ids][]", visible: false).click
            find("li", text: "Redes sociales").click

            find("div[id='select-user[curriculum_vitae][work_experience][technical_skill_ids][]", visible: false).click
            find("li", text: "Photoshop").click

            click_button 'Agregar otra experiencia'

            expect(page).to have_text("Llevas 1 registro(s) de experiencia laboral")
            expect(page).to have_text("en HoyTrabajas.com como Community manager")

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            find("div[id='select-user[curriculum_vitae][work_experience][job_category_id]", visible: false).click
            find("li", text: "Marketing").click

            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'Verde Logico'

            find("div[id='select-user[curriculum_vitae][work_experience][work_position_id]", visible: false).click
            find("li", text: "Community manager").click

            find("div[id='select-user[curriculum_vitae][work_experience][work_methodology_id]", visible: false).click
            find("li", text: "Teletrabajo").click

            find("div[id='select-user[curriculum_vitae][work_experience][city_id]", visible: false).click
            find("li", text: "Bogota").click

            #TODO  field 'localidad' is pending
            #page.select 'Suba', from: 'job_location'

            #TODO select date using capybara
            #fill_in "user[curriculum_vitae][work_experience][started_at]", :with => '2015/01/01'
            #fill_in "user[curriculum_vitae][work_experience][finished_at]", :with => '2016/12/13'

            find("div[id='select-user[curriculum_vitae][work_experience][technical_skill_ids][]", visible: false).click
            find("li", text: "Redes sociales").click

            find("div[id='select-user[curriculum_vitae][work_experience][technical_skill_ids][]", visible: false).click
            find("li", text: "Photoshop").click

            click_button 'Agregar otra experiencia'

            expect(page).to have_text("Llevas 2 registro(s) de experiencia laboral")
            expect(page).to have_text("en HoyTrabajas.com como Community manager")
            expect(page).to have_text("en Verde Logico como Community manager")

            find("div[id='select-user[curriculum_vitae][work_experience][job_category_id]", visible: false).click
            find("li", text: "Marketing").click

            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'DataWifi'

            find("div[id='select-user[curriculum_vitae][work_experience][work_position_id]", visible: false).click
            find("li", text: "Community manager").click

            find("span", text: /SIGUIENTE/).click

            #IMPORTANT - Here you must validate the creation of the tables with the information filled by user

            expect(page).to have_text("Veamos tu formación académica")
          end
        end

      end

    end
  end
end
