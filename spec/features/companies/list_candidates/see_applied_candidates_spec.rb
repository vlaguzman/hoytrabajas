require 'rails_helper'

RSpec.describe "Like a company, I want to see the applied candidates", type: :feature do

  let(:main_company) { create(:company) }
  let(:vehicles)     { [create(:vehicle, description: "Moto")] }
  let(:vehicles_b)   { [vehicles.first, create(:vehicle, description: "Carro")] }

  let(:main_offer) { create(:offer,
    title: 'Una Super Oferta',
    company: main_company,
    vehicles: vehicles
  ) }

  let(:candidate_one_cv) { create(:user, name: 'Jhonny', last_name: 'Bravo').curriculum_vitae }
  let(:candidate_two_cv) { create(:user, name: 'Alfred', last_name: 'Ito', vehicles: vehicles_b).curriculum_vitae }

  let!(:applied_offer_1) { create(:applied_offer, curriculum_vitae: candidate_one_cv, offer: main_offer) }
  let!(:applied_offer_2) { create(:applied_offer, curriculum_vitae: candidate_two_cv, offer: main_offer) }

  context "When i visit the list candidates path inside my offer" do
    context "when has applied offers" do
      scenario "should return a candidates sort by affinity percentage", js: true do
        sign_in main_company

        visit root_path

        click_on('Ver mi tablero')

        click_on('Una Super Oferta')

        expect(page).to have_text(main_offer.title)

        expect(page).to have_content('2 Candidato(s)')

        within "#candidate_0" do
          expect(page).to have_content('Alfred Ito')
          expect(page).to have_content('27%')
        end

        within "#candidate_1" do
          expect(page).to have_content('Jhonny Bravo')
          expect(page).to have_content('0%')
        end
      end
    end

    context "when has applied offers with same affinity percentage" do
      before do
        candidate_one_cv.user.update(vehicles: vehicles_b)
      end

      scenario "should return a candidates sort by applied_date", js: true do
        sign_in main_company

        visit root_path

        click_on('Ver mi tablero')

        click_on('Una Super Oferta')

        expect(page).to have_text(main_offer.title)

        save_page('daniel.html')
        expect(page).to have_content('2 Candidato(s)')

        within "#candidate_0" do
          expect(page).to have_content('Jhonny Bravo')
          expect(page).to have_content('27%')
        end

        within "#candidate_1" do
          expect(page).to have_content('Alfred Ito')
          expect(page).to have_content('27%')
        end
      end
    end

    context "when has not applied offers" do
      before do
        main_offer.applied_offers.destroy_all
      end
      scenario "should return a aplications in 0", js: true do
        sign_in main_company

        visit root_path

        click_on('Ver mi tablero')

        click_on('Una Super Oferta')

        expect(page).to have_text(main_offer.title)

        expect(page).to have_content('0 Candidato(s)')
      end
    end
  end
end
