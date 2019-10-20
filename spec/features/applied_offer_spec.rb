require 'rails_helper'

RSpec.describe "User applied offer", type: :feature, js: true do
  context "When the user is logged in and has not applied to the offer" do
    let(:new_curriculum) { create(:curriculum_vitae) }
    let(:offer) { create(:offer, title: "Test sebas") }
    let(:user) { create(:user) }
    let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

    it "Should create the association and return to the offer without the option to apply" do
      new_curriculum.user = user
      new_curriculum.save
      sign_in user
      visit offer_path(offer.id)

      expect(page).to have_content("Test sebas")
      expect(page).to have_button('Aplicar a esta oferta')

      click_button 'Aplicar a esta oferta'

      expect(page).to have_button('Aplicado')
    end
  end

  context "When the user is not logged in" do
    let(:offer) { create(:offer, title: "Test sebas") }

    it "Should ask you to register" do
      visit offer_path(offer.id)

      expect(page).to have_content("Test sebas")
      expect(page).to have_button('Aplicar a esta oferta')

      click_button 'Aplicar a esta oferta'

      expect(current_path).to eq(new_user_registration_path)
    end
  end

  context "When the user does not have a vitae curriculum" do
    let(:offer) { create(:offer, title: "Test sebas") }
    let(:user) { create(:user) }
    let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

    it "Should redirect it to create the vitae curriculum" do
      sign_in user
      visit offer_path(offer.id)

      expect(page).to have_content("Test sebas")
      expect(page).to have_button('Aplicar a esta oferta')

      click_button 'Aplicar a esta oferta'

      expect(current_path).to eq(users_wizards_step_zero_path)
    end
  end
end
