require 'rails_helper'

RSpec.describe "fill the principal candidate user data", :type => :feature do
  before {
    create(:nationality, description: "Colombiana")
    create(:nationality, description: "Peruana")
    create(:nationality, description: "Venezolana")
    create(:nationality, description: "Argentina")

    create(:document_type, description: "Cedula de Extrangeria")

    create(:city)

    create(:labor_disponibility)

    create(:work_mode)

    create(:contract_type)

    create(:sex, description: "masculino")

    create(:limitation, description: "ninguna")
    create(:limitation, description: "daltonismo")

    create(:educational_degree, description: "Profesional")
  }

  context "like a candidate user in his first login" do
    let!(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com", password: "hola12345" ) }

    it "should see the info to fill and the next button in each section" do
      #sign_in candidate
      visit new_user_session_path

      expect(page).to have_text("Log in")

      within '#new_user' do
        fill_in 'user_email', with: 'nuevousuario@gmail.com'
        fill_in 'user_password', with: 'hola12345'
        click_on 'Log in'
      end

      # a new user who has never been loged-in, i.e. sign_in_count is zero
      expect(candidate.sign_in_count).to be_zero

      expect(page).to have_text("Empecemos por conocernos")

      # dado el usuario se logea por primera vez, es redirigido a la pagina
      # de registr de informacion
      # TODO: hacer otra prueba para rediririr al usuraia a otra pantalla
      # cuando ya ha sido logueado antes

      #a new user answers the first part of the form with
      #all the required fields

      within '#update_user' do
        fill_in 'user[name]', with: 'Carlos'
        fill_in 'user[last_name]', with: 'Rojas'
        select 'Colombiana', from: 'user[nationalities][]'
        select 'Cedula de Ciudadania', from: 'user[document_type]'
        fill_in "user[identification_number]", :with => "1063558224"
        fill_in "user[contact_number]", :with => "3183638789"
        click_on 'siguiente'
      end
      save_page("paps.html")

      expect(User.count).to eq(1)
      expect(CurriculumVitae.count).to eq(1)

      expect(page).to have_text("Empecemos por conocernos")


      within '#candidate_step_two' do
        fill_in "user[about_me]", :with => "I am the best chef in the world"
        page.select 'masculino', from: 'user[sex]'
        fill_in "user[birthday]", :with => "1990-01-01"
        page.select 'ninguna', from: 'user[limitations][]'
        page.select 'Profesional', from: 'user[educational_degrees][]'
        click_button 'siguiente'
      end

      candidate = User.first

      expect(candidate.sex.description).to eq("masculino")
      expect(candidate.curriculum_vitaes.count).to eq(1)
    end
  end
end
