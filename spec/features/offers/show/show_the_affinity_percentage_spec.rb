require 'rails_helper'

RSpec.describe "like logged user", type: :feature do
  context "When visit a offer show" do

    let(:contract_type) { create(:contract_type, description: "Indefinido")}
    let(:offer_contract)  { create(:empty_offer,
      contract_type: contract_type,
      title: "A Super Offer",
      description: 'a super description')}

    let(:curriculum_vitae) { create(:curriculum_vitae,
      job_categories: offer_contract.job_categories
    ) }

    let!(:candidate) { create(:user,
      :first_time_candidate,
      name: "conan",
      contract_type: contract_type,
      curriculum_vitaes: [curriculum_vitae]
    )}


    it "Should see the affinity percentage chip", js: true do

      sign_in candidate

      visit offer_path(offer_contract)

      expect(page).to have_content("100% de afinidad")


    end
  end
end