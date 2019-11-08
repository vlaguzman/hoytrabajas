require 'rails_helper'

RSpec.describe "like new candidate", type: :feature do
  let(:curriculum_vitae) do
    create(:curriculum_vitae, :new_curriculum_vitae, user: create(:user, :first_time_candidate))
 end

 let(:candidate) { curriculum_vitae.user }

  feature "When Im the step zero page" do
    scenario "Should see the expected text", js:true do
      sign_in candidate

      visit users_wizards_step_zero_path

      expect(page).to have_text(/El trabajo ideal ¡si existe!/)
      expect(page).to have_text(/Conociendo tus habilidades y experiencia encontraremos las mejores ofertas para ti/)
      expect(page).to have_text(/Quiero completar mi perfil/)
    end
  end

  feature "When click on 'Quiero completar mi perfil'" do
    scenario "Should redirect to step one", js: true do
      sign_in candidate 

      visit users_wizards_step_zero_path

      click_on('Quiero completar mi perfil')

      expect(current_path).to eq(users_wizards_step_one_path)
    end
  end
end