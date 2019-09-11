require 'rails_helper'

RSpec.describe "fill the canditate user data", :type => :feature do
  context "like a candidate user after the principal data is filled" do
    let!(:new_curriculum) { create(:curriculum_vitae) }
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

    let!(:contract_type) { create(:contract_type, description: "Indiferente") }
    let!(:work_mode) { create(:work_mode, description: "Indiferente") }
    let!(:labor_disponibility) { create(:labor_disponibility, description: "Inmediato") }

    it "should see the offert info to fill and the next buttons" do
      #Create a user with the principal information - Use a factory
      user = create(:user,:first_time_candidate,
        name: "ELcan",
        last_name: "Didato",
        email: "user@email.com",
        password: "123456"
      )

      new_curriculum.user = user

      sign_in user

      #Visit the rute of the profile user creation - step 3
      visit users_step_three_path

      expect(page).to have_text(/Busquemos las mejores ofertas/)

      save_page('paps.html')

      within '#step_three' do
        select('seguridad', from: "form[job_category_ids][]") #it can be more than one option
        select('logistica y transporte', from: "form[job_category_ids][]")

        select('Tiempo completo', from: 'form[offer_type_ids][]') #it can be more than one option
        select('Medio tiempo', from: 'form[offer_type_ids][]')

        select('Indiferente', from: 'form[contract_type_id]')

        select('Indiferente', from:'form[work_mode_ids][]') #it can be more than one option

        select('Inmediato', from: 'form[labor_disponibility_id]')

        click_button 'siguiente'
      end

      updated_cv = user.curriculum_vitaes.first
      expect(updated_cv.labor_disponibility.description).to eq('Inmediato')

      expect(page).to have_text("Busquemos las mejores ofertas")
      fill_in "Bogota", :with => 'job_state'
      check 'work_other_cities'
      page.select 'Bogota', from: 'job_city'
      page.select 'Usaquen', from: 'job_location'
      fill_in "vehicle", :with => ['Moto', 'Carro']#it can be more than one option
      fill_in "licenses", :with => ['B1', 'B2']#it can be more than one option
      click_button 'siguiente'

      expect(page).to have_text("Busquemos las mejores ofertas")
      fill_in "days_available", :with => ['jueves', 'fines de semana']#it can be more than one option
      fill_in "working_hours", :with => ['Mañana 7am-12pm', 'Noche 10pm-3am']#it can be more than one option
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
