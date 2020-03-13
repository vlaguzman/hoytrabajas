require 'rails_helper'

RSpec.describe "like a admin user", type: :feature do
  let(:admin)                { create(:admin_user) }
  let!(:user)                { create(:user) }
  let!(:list_applied_offers) { create_list(:applied_offer, 10, curriculum_vitae: user.curriculum_vitae) }
  let!(:objective)           { create(:offer) }

  feature "When I search an offer by id" do
    scenario "Should see the applied offer", js: true do
      sign_in admin

      visit admin_applied_offers_path

      list_applied_offers.each do |offer|
        expect(page).to have_content(offer.id)
      end

      fill_in 'q[offer_id_equals]', with: objective.id

      click_button 'Filtrar'

      list_applied_offers.each do |offer|
        expect(page).to_not have_content(offer)
      end

      expect(page).to have_content(objective.title)
    end
  end
end
