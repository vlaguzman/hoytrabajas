require 'rails_helper'

RSpec.describe "like candidate in dasboard applied offers section", type: :feature do
  let(:candidate) { create(:user) }

  feature "When I not have applied to any offer" do
    scenario "Should see the message in section", js: true do
      sign_in candidate

      visit users_dashboard_path

      expect(page).to have_content(/Aún no has aplicado a ninguna oferta/)
    end
  end

  feature "When  have applied to one offer" do
    let(:offer) { create(:offer, title: "I apply to this") }
    let!(:applied_offer) { create(:applied_offer,
      curriculum_vitae: candidate.curriculum_vitae,
      offer: offer
    ) }

    scenario "Should see the message in section", js: true do
      sign_in candidate

      visit users_dashboard_path

      expect(page).to have_content(/I apply to this/)
      expect(page).to_not have_content(/Aún no has aplicado a ninguna oferta/)
    end
  end
end