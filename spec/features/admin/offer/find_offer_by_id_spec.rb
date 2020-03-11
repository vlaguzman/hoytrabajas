require 'rails_helper'

RSpec.describe "like a admin user", type: :feature do
  let(:admin)            { create(:admin_user) }
  let!(:company)         { create(:company) }
  let!(:create_offers)   { create_list(:offer, 5) }
  let!(:objective_offer) { create(:offer, company: company) }

  feature "When I search a offer by self id" do
    scenario "Should see the offer ", js: true do
      sign_in admin

      visit admin_offers_path

      create_offers.each do |offer|
        expect(page).to have_content(offer.title)
      end

      fill_in 'q[id_equals]', with: objective_offer.id

      click_button 'Filtrar'

      create_offers.each do |offer|
        expect(page).to_not have_content(offer.title)
      end

      expect(page).to have_content(objective_offer.title)
    end
  end
end
