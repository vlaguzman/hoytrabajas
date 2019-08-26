require 'rails_helper'

RSpec.describe "fill the canditate user data", :type => :feature do
  context "like a candidate user after the principal data is filled" do
    xit "should see the offert info to fill and the next buttons" do
      
      #crear usuario con informacion principal
      user = User.new('name', 'last_name', 'email')
      #visitar ruta de creación de perfil, page 3      
      visit "/candidato/#{user.id}/create_user/step3" 
      
      expect(page).to have_text("Busquemos las mejores ofertas")
      fill_in "job_categories", :with => ['seguridad', 'logistica y transporte']#it can be more than one option
      page.select ['Tiempo completo', 'Medio tiempo'], from: 'job_offer'#it can be more than one option
      page.select 'Indiferente', from: 'legal_agreement'
      page.select 'Indiferente', from: 'work_methodology'
      page.select 'Inmediato', from: 'job_availability'
      click_button 'siguiente'

      expect(page).to have_text("Busquemos las mejores ofertas")
      fill_in "Bogota", :with => 'job_state'
      check 'work_other_cities'
      page.select 'Bogota', from: 'job_city'
      page.select 'Usaquen', from: 'job_location'
      page.select 'Moto', from: 'vehicle'#it can be more than one option
      page.select 'B1', from: 'licenses'#it can be more than one option
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
      #validar la creacion de las tablas intermedias
    end
  end
end
