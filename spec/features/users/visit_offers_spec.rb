require 'rails_helper'

RSpec.describe "like sign in user", type: :feature do

  

  feature "When I click on 'Buscar Ofertas' on navbar" do
    let(:curriculum_vitae) { create(:curriculum_vitae) }
    let(:candidate) { curriculum_vitae.user }

    scenario "should redirect to offers path", js: true do
      sign_in candidate

      visit root_path

      

      click_on 'BUSCAR OFERTAS'

      expect(current_path).to eq(offers_path)
    end
  end
end