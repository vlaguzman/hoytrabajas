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

    create(:limitation, description: "ninguna")
    create(:limitation, description: "daltonismo")

    create(:educational_degree, description: "Profesional")
  }

  context "like a candidate user in his first login" do
    let!(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com", password: "hola12345" ) }

    it "should see the info to fill and the next button in each section" do

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

      within '#step_one' do
        fill_in 'user[name]', with: 'Carlos'
        fill_in 'user[last_name]', with: 'Rojas'
        select 'Colombiana', from: 'user[nationality_ids][]'
        select 'Cedula de Ciudadania', from: 'user[document_type_id]'
        fill_in "user[identification_number]", :with => "1063558224"
        fill_in "user[contact_number]", :with => "3183638789"
        click_on 'siguiente'
      end

      expect(User.count).to eq(1)
      expect(CurriculumVitae.count).to eq(1)

      expect(page).to have_text("Empecemos por conocernos")

      within '#step_two' do
        fill_in "user[about_me]", :with => "I am the best chef in the world"
        page.select 'masculino', from: 'user[sex_id]'
        fill_in "user[birthday]", :with => "1990-12-20"
        page.select 'ninguna', from: 'user[limitation_ids][]'
        page.select 'Profesional', from: 'user[educational_degree_id]'
        click_button 'siguiente'
      end

      candidate = User.first

      expect(candidate.sex.description).to eq("masculino")
      expect(candidate.about_me).to eq("I am the best chef in the world")
      expect(candidate.birthday).to eq(Date.parse("1990-12-20"))
      expect(candidate.curriculum_vitaes.count).to eq(1)
    end
  end
end
