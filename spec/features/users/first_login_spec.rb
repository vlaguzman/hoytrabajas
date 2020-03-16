require 'rails_helper'

RSpec.describe "first login of new user", :type => :feature do
  let!(:candidate) { create(:user, :first_time_candidate, email: "nuevousuario@gmail.com", password: "hola12345" ) }

  it "Should be redirect to step zero", js: true do
    VCR.use_cassette("create_user") do
      visit root_path
     
      expect(page).to have_text("Ingresar")
     
      click_on("Ingresar")
     
      within '#new_user' do
        fill_in 'user_email', with: 'nuevousuario@gmail.com'
        fill_in 'user_password', with: 'hola12345'
        find(".a-button", text: "Iniciar sesión", visible: false).click
      end
     
      expect(candidate.sign_in_count).to be_zero
      expect(page).to have_text(/El trabajo ideal ¡si existe!/)
    end
  end
end
