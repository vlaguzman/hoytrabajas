require 'rails_helper'

RSpec.describe "like new company", type: :feature do

  let(:company) { create(:company, :first_time) }

  feature "When Im the step zero page" do
    scenario "Should see the expected text", js:true do
      VCR.use_cassette("create_company") do
        sign_in company

        visit companies_first_offer_step_zero_path

        expect(page).to have_text(/La manera más rápida de crear una oferta ¡ganadora!/)
        expect(page).to have_text(/Crear tus ofertas con el uso de palabras claves, que harán el match perfecto con tu empleado ideal./)
        expect(page).to have_text(/Crear tu oferta/)
      end
    end
  end

  feature "When click on 'Crear tu oferta'" do
    scenario "Should redirect to step one", js: true do
      VCR.use_cassette("create_company") do
        sign_in company

        visit companies_first_offer_step_zero_path

        click_on('Crear tu oferta')

        expect(current_path).to eq(companies_first_offer_step_one_path)
      end
    end
  end

  feature "When click on 'Inicio'" do
    scenario "should click the home button and go to root path", js: true do
      sign_in company
      visit companies_first_offer_step_zero_path

      page.has_button?('Inicio')
      click_link_or_button('Inicio')

      expect(current_path).to eq(root_path)
    end
  end
end
