require 'rails_helper'

RSpec.describe "like candidate", type: :feature do
  feature "When I click on 'editar' in 'Perfil' card" do

    let(:candidate) { create(:user, name: 'Seyma', last_name: 'Neim') }

    scenario "should edit my basic info", js: true do
      sign_in candidate

      visit users_dashboard_path

      expect(page).to have_text(/Seyma Neim/)

      find('span', text: "Editar").click

      expect(current_path).to eq(edit_users_wizards_step_one_path)

      fill_in 'user[name]', with: 'Walter W.'
      find('span', text: /ACTUALIZAR/).click


      expect(current_path).to eq(users_dashboard_path)
      expect(page).to have_text(/Walter W. Neim/)
    end
  end

  feature "When click on 'Ir al Dashboard'" do
    let(:curriculum_vitae) do
    create(:curriculum_vitae, :empty, user: create(:user, :first_time_candidate))
    end

    let(:candidate) { curriculum_vitae.user }

    scenario "Should redirect to 'users/dashboard'", js: true do
      sign_in candidate

      visit users_wizards_step_eleven_path

      find(:button, text: 'Ir al Dashboard').click

      expect(current_path).to eq('/users/dashboard')
    end
  end
end