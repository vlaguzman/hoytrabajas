require 'rails_helper'

RSpec.describe "Like new candidate", :type => :feature do
  before do
    create(:available_work_day, description: 'jueves')
    create(:available_work_day, description: 'fines de semana')

    create(:working_day, description: 'Mañana 7am-12pm')
    create(:working_day, description: 'Noche 10pm-3am')

    create(:salary_period, description: 'Diario')
    create(:salary_period, description: 'Mensaual')

    create(:currency)
  end

  let(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com") }

  describe "When visit step five" do
    it "Should show the expected text", js: true do
      sign_in candidate

      visit users_wizards_step_five_path

      expect(page).to have_text(/¡Búsquemos las mejores ofertas!/)
    end
  end

  feature "When im in step five" do
    scenario "Should edit my information", js: true do
      sign_in candidate

      visit users_wizards_step_five_path

      find("div[id='mui-component-select-curriculum_vitae[available_work_day_ids][]", visible: false).click
      find("li", text: "jueves").click

      find("div[id='mui-component-select-curriculum_vitae[available_work_day_ids][]", visible: false).click
      find("li", text: "fines de semana").click

      find("div[id='mui-component-select-curriculum_vitae[working_day_ids][]", visible: false).click
      find("li", text: "Mañana 7am-12pm").click

      find("div[id='mui-component-select-curriculum_vitae[working_day_ids][]", visible: false).click
      find("li", text: "Noche 10pm-3am").click

      find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][range_type]", visible: false).click
      find("li", text: "Rango").click

      find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][currency_id]", visible: false).click
      find("li", text: "COP").click

      fill_in "curriculum_vitae[curriculum_vitae_salary][from]", :with => '4000'
      fill_in "curriculum_vitae[curriculum_vitae_salary][to]", :with => '10000'

      find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][salary_period_id]", visible: false).click
      find("li", text: "Diario").click

      find("span", text: /SIGUIENTE/).click

      candidate.reload

      cv = candidate.curriculum_vitae

      salary = cv.curriculum_vitae_salary

      expect(cv.available_work_days.count).to eq(2)
      expect(cv.working_days.count).to eq(2)
      expect(salary).to be_present

      expect(salary.from).to eq(4000)
      expect(salary.to).to eq(10000)
      expect(salary.salary_period.description).to eq("Diario")
    end

    feature "When set the salary with fixed range" do
      scenario "should create a offer salary with olny from 'from' value", js: true do
        sign_in candidate

        visit users_wizards_step_five_path

        find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][range_type]", visible: false).click
        find("li", text: "Fijo").click

        find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][currency_id]", visible: false).click
        find("li", text: "COP").click

        fill_in "curriculum_vitae[curriculum_vitae_salary][from]", :with => '4000'

        find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][salary_period_id]", visible: false).click
        find("li", text: "Diario").click

        find("span", text: /SIGUIENTE/).click

        candidate.reload

        salary = candidate.curriculum_vitae.curriculum_vitae_salary

        expect(salary).to be_present

        expect(salary.from).to eq(4000)
        expect(salary.to).to be_nil
        expect(salary.salary_period.description).to eq("Diario")
      end
    end
  end

  describe "visit step three but the user need return to step four" do
    feature "when click on 'Regresar'" do
      scenario "should return to step three", js: true do
        sign_in candidate

        visit users_wizards_step_five_path

        execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
        save_screenshot("javi.png")
        find("span", text: /Regresar/).click

        expect(current_path).to eq(users_wizards_step_four_path)
      end
    end
  end
end