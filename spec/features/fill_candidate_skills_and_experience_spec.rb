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

    context "I fill all data" do
      xit "should see the skills fields and the system should save on click on next button" do
        sign_in curriculum.user

        #Visit the rute of the profile user creation - step 6
        visit users_wizards_step_six_path

        expect(page).to have_text("Déjanos conocer tus habilidades")

        #it can be more than one option
        select('Creatividad', from:'user[curriculum_vitae][soft_skill_ids][]')
        select('Responsabilidad', from:'user[curriculum_vitae][soft_skill_ids][]')

        #it can be more than one option, each option is a hash
        #id, skill_name, skill_category, skill_proficiency
        select('Marketing', from: 'user[curriculum_vitae][curriculum_vitaes_technical_skills][job_category_id]')
        select('SEO', from: 'user[curriculum_vitae][curriculum_vitaes_technical_skills][technical_skill_id]')
        select('avanzado', from: 'user[curriculum_vitae][curriculum_vitaes_technical_skills][level_id]')

        #TODO With react build the feature of create many curriculum technical skills
        #select('Marketing', from: 'user[curriculum_vitae][technical_skills][curriculum_vitaes_technical_skills][job_category_ids][]')
        #select('SEM', from: 'user[curriculum_vitae][technical_skills][curriculum_vitaes_technical_skills][technical_skill_ids][]')
        #select('medio', from: 'user[curriculum_vitae][technical_skills][curriculum_vitaes_technical_skills][level][]')

        select('Marketing', from: 'user[curriculum_vitae][to_learn_skills][job_category_id]')
        select('Redes sociales', from: 'user[curriculum_vitae][to_learn_skills][technical_skill_id]')

        #TODO With react build the feature of create many curriculum to learn skills
        #select('Marketing', from: 'user[curriculum_vitae][to_learn_skills][job_category_ids][]')
        #select('Redes sociales', from: 'user[curriculum_vitae][to_learn_skills][technical_skill_ids][]')

        select('Inglés', from: 'user[curriculum_vitae][curriculum_vitaes_languages][language_id]')
        select('avanzado', from: 'user[curriculum_vitae][curriculum_vitaes_languages][level_id]')

        #TODO With react build the feature of create many curriculum languages
        #select('Inglés', from: 'user[curriculum_vitae][curriculum_vitaes_languages][language_id]')
        #select('avanzado', from: 'user[curriculum_vitae][curriculum_vitaes_languages][level_id]')

        click_button 'siguiente'

        #Validate the creation of the modeles in the DB

        expect(page).to have_text("Cuentanos un poco de tu experiencia")
      end
    end

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
          it "should see the experience fields and the next buttons, click on it and see the message of the next secction" do
            #Visit the rute of the profile user creation - step 7
            sign_in curriculum.user

            visit users_wizards_step_seven_path

            expect(page).to have_text(/¿Cuentas con experiencia?/)

            click_on /Si, quiero adicionarla/
            expect(page).to have_text(/Cuentanos un poco de tu experiencia/)

            #page.select 'Marketing', from: 'user[curriculum_vitae][work_experience][job_category_id]'
            #fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'HoyTrabajas.com'
            #page.select 'Community manager', from: 'user[curriculum_vitae][work_experience][work_position_id]'
            #page.select 'Teletrabajo', from: 'user[curriculum_vitae][work_experience][work_methodology_id]'
            #page.select 'Bogota', from: 'user[curriculum_vitae][work_experience][city_id]'

            #TODO Uncomment when the we implement 'localidades'
            #page.select 'Bogota', from: 'user[curriculum_vitae][work_experience][location_id]'

            #fill_in "user[curriculum_vitae][work_experience][started_at]", :with => '2017/01/01'
            #fill_in "user[curriculum_vitae][work_experience][finished_at]", :with => nil

            #check 'user[curriculum_vitae][work_experience][still_in_progress]'
            #page.select 'Redes sociales', from: 'user[curriculum_vitae][work_experience][technical_skill_ids][]'
            #page.select 'Photoshop', from: 'user[curriculum_vitae][work_experience][technical_skill_ids][]'

            #click_button 'siguiente'

            #IMPORTANT - Here you must validate the creation of the tables with the information filled by user

            #expect(page).to have_text("Veamos tu formación académica")
          end
        end

        context "I dont fill the job_category" do
          it "should see a message that said me 'you must fill the job_category'" do
            #Visit the rute of the profile user creation - step 8
            sign_in curriculum.user

            visit users_wizards_step_eight_path

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            select 'Community manager', from: 'user[curriculum_vitae][work_experience][work_position_id]'
            click_button 'siguiente'

            expect(page).to have_text("Debes seleccionar un Categoria de Trabajo")
          end
        end

        context "I dont fill the role" do
          it "should see a message that said me 'you must fill the role'" do
            #Visit the rute of the profile user creation - step 7
            sign_in curriculum.user

            visit users_wizards_step_eight_path

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            page.select 'Marketing', from: 'user[curriculum_vitae][work_experience][job_category_id]'
            click_button 'siguiente'

            #TODO add i18n traslations
            #expect(pag e).to have_text("El role es un campo requerido")

            expect(page).to have_text("Work position Debes seleccionar un Cargo")
          end
        end
      end

      context "I want to add more than one experience" do
        it "should see the experience fields and the button to add more experience" do
          sign_in curriculum.user

          visit users_wizards_step_seven_path

          expect(page).to have_text("¿Cuentas con experiencia?")

          click_on 'Si, quiero adicionarla'

          expect(page).to have_button('Agregar otra experiencia')
        end

        context "when I click on 'Agregar otra experiencia'" do
          it "should show me the resume and a new page to fill the information" do
            #Visit the rute of the profile user creation - step 7
            sign_in curriculum.user

            visit users_wizards_step_seven_path

            expect(page).to have_text("¿Cuentas con experiencia?")

            click_on 'Si, quiero adicionarla'

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            page.select 'Marketing', from: 'user[curriculum_vitae][work_experience][job_category_id]'
            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'HoyTrabajas.com'
            page.select 'Community manager', from: 'user[curriculum_vitae][work_experience][work_position_id]'
            page.select 'Teletrabajo', from: 'user[curriculum_vitae][work_experience][work_methodology_id]'
            page.select 'Bogota', from: 'user[curriculum_vitae][work_experience][city_id]'

            #TODO  field 'localidad' is pending
            #page.select 'Suba', from: 'job_location'

            fill_in "user[curriculum_vitae][work_experience][started_at]", :with => '2017/01/01'
            fill_in "user[curriculum_vitae][work_experience][finished_at]", :with => nil

            check 'user[curriculum_vitae][work_experience][still_in_progress]'
            page.select 'Redes sociales', from: 'user[curriculum_vitae][work_experience][technical_skill_ids][]'
            page.select 'Photoshop', from: 'user[curriculum_vitae][work_experience][technical_skill_ids][]'

            click_button 'Agregar otra experiencia'

            expect(page).to have_text("Llevas 1 registro(s) de experiencia laboral")
            expect(page).to have_text("en HoyTrabajas.com como Community manager")

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            page.select 'Marketing', from: 'user[curriculum_vitae][work_experience][job_category_id]'
            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'Verde Logico'
            page.select 'Community manager', from: 'user[curriculum_vitae][work_experience][work_position_id]'
            page.select 'Teletrabajo', from: 'user[curriculum_vitae][work_experience][work_methodology_id]'
            page.select 'Bogota', from: 'user[curriculum_vitae][work_experience][city_id]'

            #TODO  field 'localidad' is pending
            #page.select 'Suba', from: 'job_location'

            fill_in "user[curriculum_vitae][work_experience][started_at]", :with => '2015/01/01'
            fill_in "user[curriculum_vitae][work_experience][finished_at]", :with => '2016/12/13'

            page.select 'Redes sociales', from: 'user[curriculum_vitae][work_experience][technical_skill_ids][]'
            page.select 'Photoshop', from: 'user[curriculum_vitae][work_experience][technical_skill_ids][]'

            click_button 'Agregar otra experiencia'

            expect(page).to have_text("Llevas 2 registro(s) de experiencia laboral")
            expect(page).to have_text("en HoyTrabajas.com como Community manager")
            expect(page).to have_text("en Verde Logico como Community manager")

            page.select 'Marketing', from: 'user[curriculum_vitae][work_experience][job_category_id]'
            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'DataWifi'
            page.select 'Community manager', from: 'user[curriculum_vitae][work_experience][work_position_id]'

            click_button 'siguiente'

            #IMPORTANT - Here you must validate the creation of the tables with the information filled by user

            expect(page).to have_text("Veamos tu formación académica")
          end
        end

      end

    end
  end
end
