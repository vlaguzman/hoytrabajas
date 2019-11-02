require 'rails_helper'

RSpec.describe "When company finally the steps", :type => :feature do
  let(:company) { FactoryBot.create(:company, :first_time, name: 'HoyTrabajas.com') }

  describe "Arrives to finally step" do
    context "when company click in 'Completar mi perfil'" do
      scenario "should redirect to company_path", js: true do
        sign_in company
        visit companies_first_offer_step_eight_path

        expect(page).to have_content(/¡Perfecto! Has creado un perfil ganador/)
        expect(page).to have_content(/Recuerda actualizar constantemente tu perfil para contar con mayores oportunidades/)

        expect(page).to have_button('Completar mi perfil')
        expect(page).to have_link('Ir a la página principal')

        click_link_or_button('Completar mi perfil')

        expect(current_path).to eq(companies_first_offer_step_zero_path)
      end
    end

    context "when company click in 'Ir a la pagina principal'" do
      scenario "should redirect to root_path", js: true do
        sign_in company
        visit companies_first_offer_step_eight_path

        click_link_or_button('Ir a la página principal')

        expect(current_path).to eq(root_path)
      end
    end
  end
end
