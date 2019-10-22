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

    it "should see the info to fill and the next button in each section",js: true do

      visit root_path

      expect(page).to have_text("SIGN IN CANDIDATO") 

      click_on("SIGN IN CANDIDATO")

      within '#new_user' do
        fill_in 'user_email', with: 'nuevousuario@gmail.com'
        fill_in 'user_password', with: 'hola12345'
        find("span", text: "Iniciar sesión", visible: false).click
      end

      # a new user who has never been loged-in, i.e. sign_in_count is zero
      expect(candidate.sign_in_count).to be_zero
      expect(page).to have_text(/El empleado ideal ¡si existe!/)

      click_on "Quiero publicar mi oferta"

      expect(page).to have_text("Empecemos por conocernos")

      fill_in 'candidate[name]', with: 'Carlos'
      fill_in 'candidate[last_name]', with: 'Rojas'

      find("div[id='select-candidate[nationality_ids][]']", visible: false).click
      find("li", text: "Colombiana").click

      find("div[id='select-candidate[document_type_id]']", visible: false).click
      find("li", text: "Cedula de Ciudadania").click

      fill_in "candidate[identification_number]", :with => "1063558224"
      fill_in "candidate[contact_number]", :with => "3183638789"

      find("span", text: /SIGUIENTE/).click

      expect(User.count).to eq(1)
      expect(CurriculumVitae.count).to eq(1)

      expect(page).to have_text("Empecemos por conocernos")

      fill_in "user[about_me]", :with => "I am the best chef in the world"

      find("div[id='select-user[sex_id]']", visible: false).click
      find("li", text: "masculino").click

      find("input[name='user[birthday]']").click
      find("p", text: "13", visible: false).click
      find("span", text:"OK").click

      find("div[id='select-user[limitation_ids][]']", visible: false).click
      find("li", text: "ninguna").click

      find("div[id='select-user[educational_degree_id]']", visible: false).click
      find("li", text: "Profesional").click

      find("span", text: "SIGUIENTE").click

      candidate = User.first

      current_month = Date.today.month
      current_year = Date.today.year

      expect(candidate.sex.description).to eq("masculino")
      expect(candidate.about_me).to eq("I am the best chef in the world")
      expect(candidate.birthday).to eq(Date.parse("13-#{current_month}-#{current_year}"))
      expect(candidate.curriculum_vitaes.count).to eq(1)
    end

    describe "visit step two but the user need return to step one" do
      context "when click on 'Regresar'" do
        it "should return to step one", js: true do
          sign_in candidate

          visit users_wizards_step_two_path

          find("span", text: /Regresar/).click

          expect(current_path).to eq(users_wizards_step_one_path)
        end
      end
    end
  end
end
