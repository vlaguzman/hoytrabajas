require 'rails_helper'

RSpec.describe "fill the canditate user data", :type => :feature do
  context "like a candidate user after the principal data is filled" do
    let(:new_curriculum) { create(:curriculum_vitae) }
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

    let!(:vehicles) do
      [
        create(:vehicle, description: "Moto"),
        create(:vehicle, description: "Carro"),
      ]
    end

    let!(:driving_licences) do
      [
        create(:driving_licence, description: "B2"),
        create(:driving_licence, description: "B1")
      ]
    end

    let!(:available_work_days) do
      [
        create(:available_work_day, description: 'jueves'),
        create(:available_work_day, description: 'fines de semana'),
      ]
    end

    let!(:working_days) do
      [
        create(:working_day, description: 'Mañana 7am-12pm'),
        create(:working_day, description: 'Noche 10pm-3am'),
      ]
    end

    let!(:salary_periods) do
      [
        create(:salary_period, description: 'Diario'),
        create(:salary_period, description: 'Mensaual'),
      ]
    end

    let!(:contract_type) { create(:contract_type, description: "Indiferente") }
    let!(:work_mode) do
      create(:work_mode, description: "Indiferente")
      create(:work_mode, description: "Remoto")
    end
    let!(:labor_disponibility) { create(:labor_disponibility, description: "Inmediato") }
    let!(:state) { create(:state, description: 'Bogota') }
    let!(:city) { create(:city, description: 'Bogota') }
    let!(:currency) { create(:currency) }

    it "should see the offert info to fill and the next buttons", js: true do
      #Create a user with the principal information - Use a factory
      user = create(:user,:first_time_candidate,
        name: "ELcan",
        last_name: "Didato",
        email: "user@email.com",
        password: "123456"
      )

      new_curriculum.user = user
      new_curriculum.save

      sign_in user

      #Visit the rute of the profile user creation - step 3
      visit users_wizards_step_three_path

      expect(page).to have_text(/¡Búsquemos las mejores ofertas!/)

      find("div[id='select-user[curriculum_vitae][job_category_ids][]", visible: false).click
      find("li", text: "logistica y transporte").click

      find("div[id='select-user[curriculum_vitae][job_category_ids][]", visible: false).click
      find("li", text: "seguridad").click

      find("div[id='select-user[curriculum_vitae][offer_type_ids][]", visible: false).click
      find("li", text: "Tiempo completo").click

      find("div[id='select-user[curriculum_vitae][offer_type_ids][]", visible: false).click
      find("li", text: "Medio tiempo").click

      find("div[id='select-user[curriculum_vitae][contract_type_id]", visible: false).click
      find("li", text: "Indiferente").click

      find("div[id='select-user[curriculum_vitae][work_mode_ids][]", visible: false).click
      find("li", text: "Indiferente").click

      find("div[id='select-user[curriculum_vitae][work_mode_ids][]", visible: false).click
      find("li", text: "Remoto").click

      find("div[id='select-user[curriculum_vitae][labor_disponibility_id]", visible: false).click
      find("li", text: "Inmediato").click

      execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
      find( "span", text: /SIGUIENTE/).click

      updated_cv = user.curriculum_vitaes.first
      expect(updated_cv.labor_disponibility.description).to eq('Inmediato')
      expect(updated_cv.contract_type.description).to eq('Indiferente')

      expect(page).to have_text(/¡Búsquemos las mejores ofertas!/)

      find("div[id='select-user[state_id]", visible: false).click
      find("li", text: "Bogota").click

      find("span", text: "Disponibilidad para trabajar en otra ciudades").click

      find("div[id='select-user[city_id]", visible: false).click
      find("li", text: "Bogota").click

      #TODO add 'localidades' when will be required
      #page.select 'Usaquen', from: 'job_location' We wont use yet

      find("div[id='select-user[vehicle_ids][]", visible: false).click
      find("li", text: "Moto").click

      find("div[id='select-user[vehicle_ids][]", visible: false).click
      find("li", text: "Carro").click

      find("div[id='select-user[driving_licence_ids][]", visible: false).click
      find("li", text: "B2").click

      find( "span", text: /SIGUIENTE/).click

      user.reload
      expect(user.city.description).to eq('Bogota')

      expect(page).to have_text(/¡Búsquemos las mejores ofertas!/)

      find("div[id='select-user[curriculum_vitae][available_work_day_ids][]", visible: false).click
      find("li", text: "jueves").click

      find("div[id='select-user[curriculum_vitae][available_work_day_ids][]", visible: false).click
      find("li", text: "fines de semana").click


      find("div[id='select-user[curriculum_vitae][working_day_ids][]", visible: false).click
      find("li", text: "Mañana 7am-12pm").click

      find("div[id='select-user[curriculum_vitae][working_day_ids][]", visible: false).click
      find("li", text: "Noche 10pm-3am").click

      find("div[id='select-user[curriculum_vitae][curriculum_vitae_salary][range_type]", visible: false).click
      find("li", text: "Rango").click

      find("div[id='select-user[curriculum_vitae][curriculum_vitae_salary][currency_id]", visible: false).click
      find("li", text: "COP").click

      fill_in "user[curriculum_vitae][curriculum_vitae_salary][from]", :with => '4000'
      fill_in "user[curriculum_vitae][curriculum_vitae_salary][to]", :with => '10000'

      execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
      
      find("div[id='select-user[curriculum_vitae][curriculum_vitae_salary][salary_period_id]", visible: false).click
      find("li", text: "Diario").click

      find( "span", text: /SIGUIENTE/).click

      expect(page).to have_text(/Déjanos conocer tus habilidades/)
      #IMPORTANT - Here you must validate the creation of the tables with the information filled by user
    end
  end
end
