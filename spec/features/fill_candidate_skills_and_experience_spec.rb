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

    let(:curriculum) { create( :curriculum_vitae, user: create(:user, :first_time_candidate)) }

    context "I fill all data" do
      it "should see the skills fields and the system should save on click on next button" do
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
        it "should show me the option to dont add any experience, I should click on it and see the message of the next secction" do
          sign_in curriculum.user

          #Visit the rute of the profile user creation - step 7
          visit users_wizards_step_seven_path

          expect(page).to have_text(/¿Cuentas con experiencia?/)

          click_on 'No pero con disposición'

          expect(page).to have_text(/Veamos tu información académica/)
        end
      end

      context "I want to add just one experience" do
        context "I fill all data in the form" do
          let!(:job_category_id) do
            [
              create(:job_category, description: "Marketing").id
            ]
          end

          let!(:work_position_id) do
            [
              create(:work_position, description: "Community manager").id
            ]
          end


          it "should see the experience fields and the next buttons, click on it and see the message of the next secction" do
            #Visit the rute of the profile user creation - step 7
            sign_in curriculum.user

            #to the work experience migration
            #create work_methodology
            #lik with work_methodology
            #link with contract type
            #link with curriculum
            #link with job category
            #link witk work positon
            #started at field date
            #fisished at field date
            #company name field
            #still_in_progress field boolean

            visit users_wizards_step_seven_path

            expect(page).to have_text("¿Cuentas con experiencia?")
            click_on 'Sí, quiero adicionarla'

            expect(page).to have_text("Cuentanos un poco de tu experiencia")

            page.select 'Marketing', from: 'user[curriculum_vitae][work_experience][job_category_id]'
            fill_in "user[curriculum_vitae][work_experience][company_name]", :with => 'HoyTrabajas.com'
            page.select 'Community manager', from: 'user[curriculum_vitae][work_experience][work_postion_id]'


            page.select 'Teletrabajo', from: 'work_methodology'
            page.select 'Bogota', from: 'job_city'
            page.select 'Suba', from: 'job_location'
            fill_in "started_at", :with => '2017/01/01'
            fill_in "finished_at", :with => nil
            check 'still_in_progress'
            fill_in "used_technical_skills", :with => ['Redes sociales', 'Photoshop']#it can be more than one option
            click_button 'siguiente'

            #IMPORTANT - Here you must validate the creation of the tables with the information filled by user

            expect(page).to have_text("Veamos tu información académica")
          end
        end

        xcontext "I dont fill the job_category" do
          xit "should see a message that said me 'you must fill the job_category'" do
            #Visit the rute of the profile user creation - step 8
            visit "/candidato/#{user.id}/create_user/step8"

            expect(page).to have_text("Cuentanos un poco de tu experiencia")
            page.select 'Community manager', from: 'role'
            click_button 'siguiente'

            expect(page).to have_text("La categoria del trabajo es un campo requerido")
          end
        end

        xcontext "I dont fill the role" do
          xit "should see a message that said me 'you must fill the role'" do
            #Visit the rute of the profile user creation - step 7
            visit "/candidato/#{user.id}/create_user/step8" 
            
            expect(page).to have_text("Cuentanos un poco de tu experiencia")
            page.select 'Marketing', from: 'job_category'
            click_button 'siguiente'
            
            expect(page).to have_text("El role es un campo requerido")
          end
        end
      end 

      xcontext "I want to add more than one experience" do
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

          #IMPORTANT - Here you must validate the creation of the tables with the information filled by user
          
          expect(page).to have_text("Veamos tu información académica")
        end
      end
      
    end
  end
end
