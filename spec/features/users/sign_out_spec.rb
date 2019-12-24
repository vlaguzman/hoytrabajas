require 'rails_helper'

RSpec.describe "like sign in user", type: :feature do

  

  feature "When I click on 'Cerrar Sesion' on navbar" do
    let(:curriculum_vitae) { create(:curriculum_vitae) }
    let(:candidate) { curriculum_vitae.user }

    scenario "should redirect to root path", js: true do
      sign_in candidate

      visit root_path
      
      click_on 'Cerrar sesión'

      expect(current_path).to eq(root_path)

    end
  end
end