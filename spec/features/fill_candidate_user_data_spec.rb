require 'rails_helper'

RSpec.describe "fill the principal canditate user data", :type => :feature do
  context "like a candidate user in his first login" do
    it "should see the info to fill and the next button in each section" do

      # a new user who has never been loged-in, i.e. sign_in_count is zero
      user = User.create(email: 'nuevousuario@gmail.com', password: 'hola12345', password_confirmation: 'hola12345', sign_in_count: 0, confirmed_at: Date.today)

      visit new_user_session_path
      within '#new_user' do
        fill_in 'user_email', with: 'nuevousuario@gmail.com'
        fill_in 'user_password', with: 'hola12345'
        click_on 'Log in'
      end

      # dado el usuario se logea por primera vez, es redirigido a la pagina
      # de registr ode informacion
      # TODO: hacer otra prueba para rediririr al usuraia a otra pantalla
      # cuando ya ha sido logueado antes
      expect(page).to have_text("Empecemos por conocernos")

      fill_in "profiles[name]", :with => "Carlos"
      fill_in "profiles[last_name]", :with => "Rojas"
      page.select 'Colombia', from: 'profiles[:nationality]'
      page.select 'Cedula de ciudadania', from: 'profiles[:document_type]'
      fill_in "profiles[document_number]", :with => "1063558224"
      fill_in "profiles[contact_number]", :with => "3183638789"
      click_button 'siguiente'

      expect(User.count).to eq 1
      expect(CurriculumVitae.count).to eq 1

      expect(page).to have_text("Empecemos por conocernos")
      fill_in "about_you", :with => "I am the best chef in the world"
      page.select 'masculino', from: 'gender'
      fill_in "birthday", :with => "1990/01/01"
      page.select 'ninguna', from: 'special_condition'
      page.select 'Profesional', from: 'education'
      click_button 'siguiente'

      candidate = User.first
      curriculum = candidate.curriculum_vitae
      expect(curriculum.gender.description).to eq("male")
    end
  end
end
