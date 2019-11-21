require 'rails_helper'

RSpec.describe "User can Log In", type: :feature do

  

  before {
    create(:user, email: "example@email.com", password: "Asdf1234")
    create(:admin_user, email: "admin@email.com", password: "admin1234")
  }

  context "a admin user must be able to login" do
    scenario "redirect after login to the active admin views", js: true do
      
      visit new_admin_user_session_path
      expect(page).to have_content("Bienvenido a HoyTrabajas")

      within "#new_admin_user" do
        fill_in "admin_user_email", with: 'admin@email.com'
        fill_in "admin_user_password", with: 'admin1234'
        has_button?("Iniciar sesión")
        find("span", text: "Iniciar sesión", visible: false).click
      end
      expect(page).to have_content("Active Admin")
    end 
  end 

  context "a registered user must be able to login" do
    scenario "redirect after login", js: true do

      visit root_path

      

      expect(page).to have_content("SIGN IN CANDIDATO")

      has_button?("SIGN IN CANDIDATO")
      click_on("SIGN IN CANDIDATO")

      within "#new_user" do
        fill_in "user_email", with: 'example@email.com'
        fill_in "user_password", with: 'Asdf1234'
        has_button?("Iniciar sesión")
        find("span", text: "Iniciar sesión", visible: false).click
      end

      expect(current_path).to eq(users_dashboard_path)
    end

    scenario "the user want to come back to home page", js: true do
      visit root_path      

      expect(page).to have_content("SIGN IN CANDIDATO")

      has_button?("SIGN IN CANDIDATO")
      find('span', text:/SIGN IN CANDIDATO/).click

      find(".modal--close-icon").click

      expect(page).to have_text("El empleo ideal para tu tiempo libre") 
      expect(current_path).to eq(root_path)
    end
  end
end
