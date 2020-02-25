require 'rails_helper'

RSpec.describe "like a admin user", :type => :feature do
  let(:admin)               { create(:admin_user) }
  let!(:user)               { create(:user, email: 'examplo@mail.com') } 
  let!(:list_applied_offers) { create_list(:applied_offer, 5) } 
  let!(:objective)          { create(:applied_offer, curriculum_vitae: user.curriculum_vitae) }

  feature "When I search a candidate by mail" do
    scenario "Should see the offers applied by candidate", js: true do
      sign_in admin

      visit admin_applied_offers_path

      list_applied_offers.each do |offer|
        expect(page).to have_content(offer.id)
      end

      fill_in 'q[curriculum_vitae_user_email_contains]', with: user.email

      click_button 'Filtrar'

      list_applied_offers.each do |offer|
        expect(page).to_not have_content(offer)
      end

      expect(page).to have_content(objective.offer_id)

    end
  end
end
