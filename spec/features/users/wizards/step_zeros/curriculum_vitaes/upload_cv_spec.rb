require 'rails_helper'

RSpec.describe "like new candidate", type: :feature do
  let(:user) { create(:user) }

  feature "When Im the upload curriculum vitae page" do
    scenario "When the resume goes up and goes to step zero", js:true do
      sign_in user

      visit users_wizards_step_zeros_curriculum_vitae_path

      attach_file('user[file_cv]', Rails.root + "spec/factories/pdfs/diploma.pdf", make_visible: true)

      expect(page).to have_content("Cuentas con una hoja de vida?")
      expect(page).to have_content("Subiendo tu hoja de vida podras simplificar el diligenciamiento de tu perfil")
      expect(page).to have_field("user[file_cv]")
      expect(page).to have_button("Continuar")

      click_button("Continuar")

      expect(users_wizards_step_one_path)
      expect(user.curriculum_vitae.file_cv.attached?).to be_truthy
    end

    scenario "When no resume goes up and on to continue", js:true do
      sign_in user

      visit users_wizards_step_zeros_curriculum_vitae_path

      expect(page).to have_content("Cuentas con una hoja de vida?")
      expect(page).to have_content("Subiendo tu hoja de vida podras simplificar el diligenciamiento de tu perfil")
      expect(page).to have_field("user[file_cv]")
      expect(page).to have_button("Continuar")

      click_button("Continuar")

      expect(users_wizards_step_one_path)
      expect(user.curriculum_vitae.file_cv.attached?).to be_falsey
    end

    scenario "When he returns", js:true do
      sign_in user

      visit users_wizards_step_zeros_curriculum_vitae_path

      expect(page).to have_content("Cuentas con una hoja de vida?")
      expect(page).to have_content("Subiendo tu hoja de vida podras simplificar el diligenciamiento de tu perfil")
      expect(page).to have_field("user[file_cv]")
      expect(page).to have_link("Regresar")
      expect(page).to have_button("Continuar")
      expect(page).to have_link("No tengo hoja de vida")

      click_link("Regresar")

      expect(users_wizards_step_zeros_curriculum_vitae_path)
    end

    scenario "When you skip", js:true do
      sign_in user

      visit users_wizards_step_zeros_curriculum_vitae_path

      expect(page).to have_content("Cuentas con una hoja de vida?")
      expect(page).to have_content("Subiendo tu hoja de vida podras simplificar el diligenciamiento de tu perfil")
      expect(page).to have_field("user[file_cv]")
      expect(page).to have_link("Regresar")
      expect(page).to have_button("Continuar")
      expect(page).to have_link("No tengo hoja de vida")

      click_link("No tengo hoja de vida")

      expect(users_wizards_step_one_path)
    end
  end
end
