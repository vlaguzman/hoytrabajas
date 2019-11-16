require 'rails_helper'

RSpec.describe "like sign in user", type: :feature do

  

  feature "When I click on 'Mi Perfil' on navbar" do
    let(:curriculum_vitae) { create(:curriculum_vitae) }
    let(:candidate) { curriculum_vitae.user }

    scenario "should redirect to my profile path", js: true do
      sign_in candidate

      visit root_path

      

      click_on 'MI PERFIL'

      #TODO when the profile is ready uncomment this an delete line 17
      #expect(current_path).to eq(users_profile_path)

      expect(current_path).to eq(users_dashboard_path)
    end
  end
end