require 'rails_helper'

RSpec.describe "Like new candidate", :type => :feature do
  before do
    create(:state, description: "Caldas")

    create(:city, description: "La Dorada")

    create(:vehicle, description: "Moto")
    create(:vehicle, description: "Carro")

    create(:driving_licence, description: "B2")
    create(:driving_licence, description: "B1")

    create(:available_work_day, description: 'jueves')
    create(:available_work_day, description: 'fines de semana')

    create(:working_day, description: 'Mañana 7am-12pm')
    create(:working_day, description: 'Noche 10pm-3am')

    create(:salary_period, description: 'Diario')
    create(:salary_period, description: 'Mensaual')

    create(:currency)
  end

  let(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com") }

  describe "When visit step four" do
    it "Should show the expected text", js: true do
      sign_in candidate

      visit users_wizards_step_four_path

      expect(page).to have_text(/¡Búsquemos las mejores ofertas!/)
    end
  end

  feature "When im in step four" do
    scenario "Should edit my information", js: true do
      sign_in candidate

      visit users_wizards_step_four_path

      find("div[id='select-user[state_id]", visible: false).click
      find("li", text: "Caldas").click

      find("span", text: "Disponibilidad para trabajar en otra ciudades").click

      find("div[id='select-user[city_id]", visible: false).click
      find("li", text: "La Dorada").click

      find("div[id='select-user[vehicle_ids][]", visible: false).click
      find("li", text: "Moto").click

      find("div[id='select-user[vehicle_ids][]", visible: false).click
      find("li", text: "Carro").click

      find("div[id='select-user[driving_licence_ids][]", visible: false).click
      find("li", text: "B2").click

      find("div[id='select-user[driving_licence_ids][]", visible: false).click
      find("li", text: "B1").click

      find("span", text: /SIGUIENTE/).click

      candidate.reload

      cv = candidate.curriculum_vitae

      expect(cv.travel_disponibility).to be_truthy
      expect(candidate.vehicles.count).to eq(2)
      expect(candidate.city.description).to eq("La Dorada")
      expect(candidate.driving_licences.count).to eq(2)
    end
  end

  describe "visit step three but the user need return to step three" do
    feature "when click on 'Regresar'" do
      scenario "should return to step three", js: true do
        sign_in candidate

        visit users_wizards_step_four_path

        execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
        find("span", text: /Regresar/).click

        expect(current_path).to eq(users_wizards_step_three_path)
      end
    end
  end
end