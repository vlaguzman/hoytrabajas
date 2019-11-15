require 'rails_helper'

RSpec.describe "like sign in user", type: :feature do

  def skip_under_construction
    find("button[id='home-welcome-modal']", visible: false).click
    execute_script "window.scrollTo(0, (window.innerHeight * 2))"
  end

  feature "When I click on 'Ver Mi Tablero' on navbar" do
    let(:curriculum_vitae) { create(:curriculum_vitae) }
    let(:candidate) { curriculum_vitae.user }

    scenario "should redirect to my dashboard path", js: true do
      sign_in candidate

      visit root_path

      skip_under_construction

      click_on 'VER MI TABLERO'

      expect(current_path).to eq(users_dashboard_path)
    end
  end
end