require 'rails_helper'

RSpec.describe "like new candidate", type: :feature do
  let(:user) { create(:user) }

  feature "When Im the step zero page" do
    scenario "Should see the expected text", js:true do
      sign_in user 

      visit users_wizards_step_zeros_curriculum_vitae_path

      attach_file('user[file_cv]', Rails.root + "spec/factories/pdfs/diploma.pdf", make_visible: true)

      expect(page).to have_content("Cuentas con una hoja de vida?")
      expect(page).to have_content("Subiendo tu Curriculum podras simplificar el diligenciamiento de tu perfil")
      expect(page).to have_field("user[file_cv]")
      expect(page).to have_button("Continuar")

      click_button("Continuar")

      expect(current_path)
    end
  end
end
