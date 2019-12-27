require 'rails_helper'

RSpec.describe "Like a company, I wan to see the applied candidates", type: :feature do

  let(:main_company) { create(:company) }

  let(:main_offer) { create(:offer,
    title: 'Una Super Oferta',
    company: main_company
  ) }

  let(:candidate_one_cv) { create(:user, name: 'Jhonny', last_name: 'Bravo').curriculum_vitae }
  let(:candidate_two_cv) { create(:user, name: 'Alfred', last_name: 'Ito').curriculum_vitae }

  let!(:applied_offer1) { create(:applied_offer, curriculum_vitae: candidate_one_cv, offer: main_offer) }
  let!(:applied_offer2) { create(:applied_offer, curriculum_vitae: candidate_two_cv, offer: main_offer) }

  feature "When i visit the list candidates path of my offer" do
    scenario "Should show me the candidates", js: true do
      sign_in main_company

      visit root_path

      click_on('Ver mi tablero')

      click_on('Una Super Oferta')

      expect(page).to have_content('2 Candidato(s)')
      expect(page).to have_content('Jhonny Bravo')
      expect(page).to have_content('Alfred Ito')
    end
  end

end