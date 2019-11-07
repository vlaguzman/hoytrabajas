require 'rails_helper'

RSpec.describe "like new company", type: :feature do

 let(:company) { create(:company, :first_time) }

  feature "When Im the step zero page" do
    scenario "Should see the expected text", js:true do
      sign_in company

      visit companies_first_offer_step_zero_path

      expect(page).to have_text(/El empleado ideal ¡si existe!/)
      expect(page).to have_text(/Y crear una oferta atractiva para llegar a el es muy facil ¡vamos a hacerlo!/)
      expect(page).to have_text(/Quiero publicar mi oferta/)
    end
  end

  feature "When click on 'Quiero completar mi perfil'" do
    scenario "Should redirect to step one", js: true do
      sign_in company

      visit companies_first_offer_step_zero_path

      click_on('Quiero publicar mi oferta')

      expect(current_path).to eq(companies_first_offer_step_one_path)
    end
  end
end