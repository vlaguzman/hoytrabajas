require 'rails_helper'

RSpec.describe "apply offer from home", type: :feature, js: :true do

  let(:user)                  { create(:user) }
  let!(:new_curriculum)       { create(:curriculum_vitae, user_id: user.id) }
  let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

  context "When user applied offer" do
    scenario "When the user is logged in and has not applied to the offer, should create the association" do
      sign_in user
      offer = FactoryBot.create(:offer, title: 'I am a sexy offer')
      visit root_path

      expect(page).to have_text("I Am A Sexy Offer")
      find(".cardOffer").hover
      expect(page).to have_button('Aplicar a esta oferta')
      click_on("Aplicar a esta oferta", match: :first)

      expect(AppliedOffer.count).to eq(1)
      expect(page).to have_button('Aplicado')
    end

    scenario "When the user is not logged in, should ask you to register" do
      sign_in user
      offer = FactoryBot.create(:offer, title: 'I am a sexy offer')
      visit root_path

      expect(page).to have_text("I Am A Sexy Offer")
      find(".cardOffer").hover
      expect(page).to have_button('Aplicar a esta oferta')
      click_on("Aplicar a esta oferta", match: :first)

      expect(current_path).to eq(new_user_registration_path)
      expect(AppliedOffer.count).to eq(0)
    end
  end
end
