require 'rails_helper'

RSpec.describe "Like new candidate", :type => :feature do
  before do
    create(:sex, description: "Masculino")
    create(:limitation, description: 'Ninguna')
    create(:educational_degree, description: 'Profesional')
  end

  let(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com") }
  let(:current_month) { Time.zone.now.month }

  describe "When the required fields does not filled", js: true do
    it "Should return a errors message" do
      sign_in candidate

      visit users_wizards_step_two_path

      find("span", text: /SIGUIENTE/).click

      expect(page).to have_text('* Describe un poco más tu perfil, este campo no puede estar vacío.')
    end
  end

  describe "When visit step two" do
    it "Should show the expected text", js: true do
      sign_in candidate

      visit users_wizards_step_two_path

      expect(page).to have_text("Empecemos por conocernos")
    end

    it "Should be able to go home", js: true do
      sign_in candidate
      visit users_wizards_step_two_path
  
      click_link_or_button('Inicio')
      expect(current_path).to eq(root_path)
    end
  end

  feature "When im in step two" do
    scenario "Should edit my information", js: true do
      sign_in candidate

      visit users_wizards_step_two_path

      fill_in "user[about_me]", :with => "I am the best chef in the world"

      find("div[id='mui-component-select-user[sex_id]']", visible: false).click
      find("li", text: "Masculino").click

      find("input[name='user[birthday]']").click
      find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
      find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"1995", visible: false).click
      find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "29").click
      click_on "OK"

      find("div[id='mui-component-select-user[limitation_ids][]']", visible: false).click
      find("li", text: "Ninguna").click

      find("div[id='mui-component-select-user[educational_degree_id]']", visible: false).click
      find("li", text: "Profesional").click

      find("span", text: /SIGUIENTE/).click

      candidate.reload

      expect(candidate.about_me).to eq('I am the best chef in the world')
      expect(candidate.sex.description).to eq('Masculino')
      expect(candidate.birthday).to eq(Date.new(1995, current_month, 29))
      expect(candidate.limitations.last.description).to eq('Ninguna')
    end
  end

  describe "visit step two but the user need return to step one" do
    feature "when click on 'Regresar'" do
      scenario "should return to step one", js: true do
        sign_in candidate

        visit users_wizards_step_two_path

        execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
        find("span", text: /Regresar/).click

        expect(current_path).to eq(users_wizards_step_one_path)
      end
    end
  end
end