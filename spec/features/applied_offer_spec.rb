require 'rails_helper'

RSpec.describe "User applied offer", type: :feature do
  let(:offer)                 { create(:offer, title: "Test sebas") }
  let(:user)                  { create(:user) }
  let!(:new_curriculum)       { create(:curriculum_vitae, user_id: user.id) }
  let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

  context "When user applied offer" do
    scenario "When the user is logged in and has not applied to the offer, should create the association", js: true do
      sign_in user
      visit offer_path(offer.id)

      expect(page).to have_content("Test sebas")
      expect(page).to have_button('Aplicar a esta oferta')

      click_button 'Aplicar a esta oferta'

      expect(page).to have_button('Aplicado')
    end

    scenario "When the user is not logged in, should ask you to register", js: true do
      visit offer_path(offer.id)

      expect(page).to have_content("Test sebas")
      expect(page).to have_button('Aplicar a esta oferta')

      click_button 'Aplicar a esta oferta'

      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
