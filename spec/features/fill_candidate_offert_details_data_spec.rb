require 'rails_helper'

RSpec.describe "fill the canditate user data", :type => :feature do
  context "like a candidate user after the principal data is filled" do
    let(:new_curriculum) { create(:curriculum_vitae) }
    let!(:job_categories) do
      [
        create(:job_category, description: 'seguridad'),
        create(:job_category, description: 'logistica y transporte')
      ]
    end

    let!(:offer_types) do
      [
        create(:offer_type, description: 'Tiempo completo'),
        create(:offer_type, description: 'Medio tiempo')
      ]
    end

    let!(:vehicles) do
      [
        create(:vehicle, description: "Moto"),
        create(:vehicle, description: "Carro"),
      ]
    end

    let!(:driving_licences) do
      [
        create(:driving_licence, description: "B2"),
        create(:driving_licence, description: "B1")
      ]
    end

    let!(:contract_type) { create(:contract_type, description: "Indiferente") }
    let!(:work_mode) { create(:work_mode, description: "Indiferente") }
    let!(:labor_disponibility) { create(:labor_disponibility, description: "Inmediato") }
    let!(:state) { create(:state, description: 'Bogota') }
    let!(:city) { create(:city, description: 'Bogota') }

    it "should see the offert info to fill and the next buttons" do
      #Create a user with the principal information - Use a factory
      user = create(:user,:first_time_candidate,
        name: "ELcan",
        last_name: "Didato",
        email: "user@email.com",
        password: "123456"
      )

      new_curriculum.user = user
      new_curriculum.save

      sign_in user

      #Visit the rute of the profile user creation - step 3
      visit users_step_three_path

      expect(page).to have_text(/Busquemos las mejores ofertas/)

      within '#step_three' do
        select('seguridad', from: "user[curriculum_vitae][job_category_ids][]") #it can be more than one option
        select('logistica y transporte', from: "user[curriculum_vitae][job_category_ids][]")

        select('Tiempo completo', from: 'user[curriculum_vitae][offer_type_ids][]') #it can be more than one option
        select('Medio tiempo', from: 'user[curriculum_vitae][offer_type_ids][]')

        select('Indiferente', from: 'user[curriculum_vitae][contract_type_id]')

        select('Indiferente', from:'user[curriculum_vitae][work_mode_ids][]') #it can be more than one option

        select('Inmediato', from: 'user[curriculum_vitae][labor_disponibility_id]')

        click_button 'siguiente'
      end

      updated_cv = user.curriculum_vitaes.first
      expect(updated_cv.labor_disponibility.description).to eq('Inmediato')
      expect(updated_cv.contract_type.description).to eq('Indiferente')

      expect(page).to have_text(/Busquemos las mejores ofertas/)

      within '#step_four' do
        select('Bogota', from: "states")

        check('user[curriculum_vitae][travel_disponibility]')

        select('Bogota', from: "user[city_id]")

        #TODO add 'localidades' when will be required
        #page.select 'Usaquen', from: 'job_location' We wont use yet

        select('Moto', from: "user[vehicle_ids][]")
        select('Carro', from: "user[vehicle_ids][]")

        select('B1', from: "user[driving_licence_ids][]")
        select('B2', from: "user[driving_licence_ids][]")

        click_button 'siguiente'
      end

      expect(user.city.description).to eq('Bogota')

      save_page('paps.html') #TODO removeme

      expect(page).to have_text(/Busquemos las mejores ofertas/)

      let(:available_work_days) do
        [
          create(:available_work_day, description: 'jueves'),
          create(:available_work_day, description: 'fines de semana'),
        ]
      end

      let(:working_days) do
        [
          create(:working_day, description: 'Mañana 7am-12pm'),
          create(:working_day, description: 'Noche 10pm-3am'),
        ]
      end

      within '#step_four' do
        select('jueves', from: "user[available_work_day_ids][]")
        select('fines de semana', from: "user[curriculum_vitae][available_work_day_ids][]")

        select('Mañana 7am-12pm', from: "user[curriculum_vitae][working_hours][]")
        select('Noche 10pm-3am', from: "user[curriculum_vitae][working_hours][]")
      end
      page.select 'Rango', from: 'type_range'
      fill_in "min_salary", :with => '4000'
      fill_in "max_salary", :with => '10000'
      page.select 'Día', from: 'salary_interval'
      click_button 'siguiente'

      expect(page).to have_text("Dejanos conocer tus habilidades")
      #IMPORTANT - Here you must validate the creation of the tables with the information filled by user
    end
  end
end
