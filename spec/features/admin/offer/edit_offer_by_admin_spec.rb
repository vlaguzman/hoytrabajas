require 'rails_helper'

RSpec.describe "Admin can edit an offer", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "a admin user must be able to edit a created offer" do

    let!(:offer) { create(:offer, title: 'the best offer in the city') }
    
    scenario "the admin select an offer and edit all the data" do
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path 
      expect(page).to have_content("Active Admin")

      has_button?("Offers")
      click_on("Offers")

      expect(page).to have_content("the best offer in the city")
      has_button?("Editar")
      click_on("Editar")
      expect(page).to have_content("Editar Offer")

      within '#edit_offer' do
        fill_in 'offer_title', with: 'Actually is just the second best offer'
        click_on 'Guardar Offer'
      end

      expect(page).to have_content("Actually is just the second best offer")
      expect(Offer.count).to eq(1)
      expect(Offer.last.title).to eq("Actually is just the second best offer")
      Offer.destroy_all
    end

  end
end
