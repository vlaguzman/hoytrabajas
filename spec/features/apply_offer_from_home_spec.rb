require 'rails_helper'

def skip_under_construction
  find("button[id='home-welcome-modal']", visible: false).click
  execute_script "window.scrollTo(0, (window.innerHeight * 2))"
end

RSpec.describe "apply offer from home", type: :feature, js: :true do
  include Capybara::DSL

  let(:user)                  { create(:user) }
  let!(:new_curriculum)       { create(:curriculum_vitae, user_id: user.id) }
  let!(:applied_offer_status) { create(:applied_offer_status, description: 'applied') }

  context "When user applied offer" do
    it "When the user is logged in and has not applied to the offer, should create the association" do
      sign_in user
      offer = FactoryBot.create(:offer, title: 'I am a sexy offer')
      visit root_path

      skip_under_construction

      expect(page).to have_text("I Am A Sexy Offer")
      find(".cardOffer", match: :first).hover
      has_css?('.btn-apply')
      find(".btn-apply", match: :first).click

      expect(current_path).to eq(offer_path(offer.id))
      expect(page).to have_button('Aplicado')
      expect(AppliedOffer.count).to eq(1)
    end

    it "When the user is logged in and had applied to a offer, should not create the association again" do
      sign_in user
      offer = FactoryBot.create(:offer, title: 'I am a sexy offer')

      visit root_path
      skip_under_construction

      expect(page).to have_text("I Am A Sexy Offer")
      find(".cardOffer", match: :first).hover
      has_css?('.btn-apply')
      find(".btn-apply", match: :first).click

      expect(current_path).to eq(offer_path(offer.id))
      expect(page).to have_button('Aplicado')
      expect(AppliedOffer.count).to eq(1)

      visit root_path
      skip_under_construction

      expect(page).not_to have_text("I Am A Sexy Offer")
      expect(AppliedOffer.count).to eq(1)
    end

    it "When the user is not logged in, should ask you to register" do
      Offer.destroy_all
      offer = FactoryBot.create(:offer, title: 'I am the offer for you')
      visit root_path

      skip_under_construction

      expect(page).to have_text("I Am The Offer For You")
      find(".cardOffer", match: :first).hover
      has_css?('.btn-apply')
      find(".btn-apply", match: :first).click

      expect(current_path).to eq(new_user_registration_path)
      expect(AppliedOffer.count).to eq(0)
    end

  end
end
