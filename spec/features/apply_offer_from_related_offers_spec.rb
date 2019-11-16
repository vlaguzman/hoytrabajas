require 'rails_helper'

RSpec.describe "User applied offer from the related offer section", type: :feature, js: :true do
  let(:user)                     { create(:user) }
  let!(:job_category)            { create(:job_category, description: "sales") }
  let!(:offer)                   { create(:offer, title: "offer_a", job_categories: [job_category]) }
  let!(:offer_b)                 { create(:offer, title: "offer_b", job_categories: [job_category]) }
  let!(:new_curriculum)          { create(:curriculum_vitae, user_id: user.id) }
  let!(:applied_offer_status)    { create(:applied_offer_status, description: 'applied') }

  context "When the user is logged in and has not applied to the offer" do
    it "should create the association" do
      sign_in user

      visit offer_path(offer.id)

      expect(page).to have_text("Offer_b")
      find(".cardOffer", match: :first).hover
      has_css?('.btn-apply')
      find(".btn-apply", match: :first).click

      expect(current_path).to eq(offer_path(offer_b.id))
      expect(page).to have_button('Aplicado')
      expect(AppliedOffer.count).to eq(1)
    end
  end
  
  context "When the user is logged in and had applied to a offer" do
    it "should not create the association again" do
      sign_in user

      visit offer_path(offer.id)

      expect(page).to have_text("Offer_b")
      find(".cardOffer", match: :first).hover
      has_css?('.btn-apply')
      find(".btn-apply", match: :first).click

      expect(current_path).to eq(offer_path(offer_b.id))
      expect(page).to have_button('Aplicado')
      expect(AppliedOffer.count).to eq(1)

      visit offer_path(offer.id)
      expect(page).not_to have_text("Offer_b")
      expect(AppliedOffer.count).to eq(1)
    end
  end

  context "When the user is not logged in" do
    it "should ask you to register" do
      visit offer_path(offer.id)

      expect(page).to have_text("Offer_b")
      find(".cardOffer", match: :first).hover
      has_css?('.btn-apply')
      find(".btn-apply", match: :first).click

      expect(current_path).to eq(new_user_registration_path)
      expect(AppliedOffer.count).to eq(0)
    end
  end

end
