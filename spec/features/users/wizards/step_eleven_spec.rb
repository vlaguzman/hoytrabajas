require 'rails_helper'

RSpec.describe "like new candidate", :type => :feature do
  feature "When click on 'Completar mi perfil'" do
    let(:curriculum_vitae) do
       create(:curriculum_vitae, :new_curriculum_vitae, user: create(:user, :first_time_candidate))
    end

    let(:candidate) { curriculum_vitae.user }

    scenario "Should redirect to 'users/dashboard'", js: true do
      sign_in candidate

      visit users_wizards_step_eleven_path

      find(:button, text: 'Completar mi perfil').click

      expect(current_path).to eq('/users/dashboard')
    end
  end
end