require 'rails_helper'

RSpec.describe "Like new candidate", :type => :feature do
  before do
    create(:job_category, description: 'seguridad')
    create(:job_category, description: 'logistica y transporte')

    create(:offer_type, description: "Tiempo completo")
    create(:offer_type, description: "Medio tiempo")

    create(:contract_type, description: "Indiferente")

    create(:work_mode, description: "Indiferente")
    create(:work_mode, description: "Remoto")

    create(:labor_disponibility, description: "Inmediato")

    create(:city, description: "La Dorada", state: create(:state, description: "Caldas"))

    create(:vehicle, description: "Moto")
    create(:vehicle, description: "Carro")

    create(:driving_licence, description: "B2")
    create(:driving_licence, description: "B1")
  end

  let(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com") }

  describe "When visit step three" do

    describe "When the required fields does not filled", js: true do
      it "Should return a errors message" do
        sign_in candidate

        visit users_wizards_step_three_path

        find("span", text: /SIGUIENTE/).click

        expect(page).to have_text('* Debes seleccionar por lo menos una categoría en la que desees buscar trabajo, este campo no puede estar vacío.')
      end
    end

    it "Should show the expected text", js: true do
      sign_in candidate

      visit users_wizards_step_three_path

      expect(page).to have_text(/¡Búsquemos las mejores ofertas!/)
    end

    it "Should be able to go home", js: true do
      sign_in candidate
      visit users_wizards_step_three_path

      has_button?('Inicio')
      click_link_or_button('Inicio')
      expect(current_path).to eq(root_path)
    end

    it "Should see the progress bar with the correct % of completion", js: true do
      sign_in candidate
      visit users_wizards_step_three_path

      expect( find('.progressBar__bar', visible: false).value.to_i ).to eq((100 / 11 * 4))
    end
  end

  feature "When im in step three" do
    scenario "Should edit my information", js: true do
      sign_in candidate

      visit users_wizards_step_three_path

      find("div[id='mui-component-select-curriculum_vitae[job_category_ids][]", visible: false).click
      find("li", text: "logistica y transporte").click

      find("div[id='mui-component-select-curriculum_vitae[job_category_ids][]", visible: false).click
      find("li", text: "seguridad").click

      find("div[id='mui-component-select-curriculum_vitae[offer_type_ids][]", visible: false).click
      find("li", text: "Tiempo completo").click

      find("div[id='mui-component-select-curriculum_vitae[offer_type_ids][]", visible: false).click
      find("li", text: "Medio tiempo").click

      find("div[id='mui-component-select-curriculum_vitae[contract_type_id]", visible: false).click
      find("li", text: "Indiferente").click

      find("div[id='mui-component-select-curriculum_vitae[work_mode_ids][]", visible: false).click
      find("li", text: "Indiferente").click

      find("div[id='mui-component-select-curriculum_vitae[work_mode_ids][]", visible: false).click
      find("li", text: "Remoto").click

      find("div[id='mui-component-select-curriculum_vitae[labor_disponibility_id]", visible: false).click
      find("li", text: "Inmediato").click

      find("span", text: /SIGUIENTE/).click

      candidate.reload

      cv = candidate.curriculum_vitae

      expect(cv.job_categories.count).to eq(2)
      expect(cv.offer_types.count).to eq(2)
      expect(cv.contract_type.description).to eq("Indiferente")
      expect(cv.work_modes.count).to eq(2)
      expect(cv.labor_disponibility.description).to eq("Inmediato")
    end
  end

  describe "visit step three but the user need return to step two" do
    feature "when click on 'Regresar'" do
      scenario "should return to step two", js: true do
        sign_in candidate

        visit users_wizards_step_three_path

        execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
        find("span", text: /Regresar/).click

        expect(current_path).to eq(users_wizards_step_two_path)
      end
    end
  end
end