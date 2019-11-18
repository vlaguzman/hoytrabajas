require 'rails_helper'

RSpec.describe "Admin can edit an appliend offer", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "a admin user must be able to edit a applied offer" do

    scenario "the admin select an offer and edit all the data" do
      offer_one = FactoryBot.create(:offer, title: 'offer one')
      offer_two = FactoryBot.create(:offer, title: 'offer two')
      curriculum_vitae_one = FactoryBot.create(:curriculum_vitae) 
      curriculum_vitae_two = FactoryBot.create(:curriculum_vitae)
      applied_offer = FactoryBot.create(:applied_offer, offer: offer_one, curriculum_vitae: curriculum_vitae_one)

      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path 
      expect(page).to have_content("Applied Offers")

      has_button?("Applied Offers")
      click_on("Applied Offers")

      expect(page).to have_content("offer one")
      has_button?("Editar")
      click_on("Editar")
      expect(page).to have_content("Editar Applied Offer")

      within '#edit_applied_offer' do
        select('offer two', from: 'applied_offer_offer_id')
        select(curriculum_vitae_two.user.email, from: 'applied_offer_curriculum_vitae_id')
        click_on 'Guardar Applied offer'
      end

      expect(page).to have_content("offer two")
      expect(AppliedOffer.count).to eq(1)
      expect(AppliedOffer.last.curriculum_vitae.user_email).to eq(curriculum_vitae_two.user_email)
      AppliedOffer.destroy_all
    end

  end
end
