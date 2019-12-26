require 'rails_helper'

RSpec.describe "like sign in user", type: :feature do

  

  feature "When I click on 'Ver Mi Tablero' on navbar" do
    let(:curriculum_vitae) { create(:curriculum_vitae) }
    let(:candidate) { curriculum_vitae.user }

    scenario "should redirect to my dashboard path", js: true do
      sign_in candidate

      visit root_path

      

      click_on 'Ver mi tablero'

      expect(current_path).to eq(users_dashboard_path)
    end
  end
end