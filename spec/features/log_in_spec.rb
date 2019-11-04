require 'rails_helper'

RSpec.describe "User can Log In", type: :feature do

  def skip_under_construction
    find("button[id='home-welcome-modal']", visible: false).click
    execute_script "window.scrollTo(0, (window.innerHeight * 2))"
  end

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
        has_button?("INICIAR SESIÓN")
        find("span", text: "Iniciar sesión", visible: false).click
      end
      expect(page).to have_content("Active Admin")
    end 
  end 

  context "a registered user must be able to login" do
    scenario "redirect after login", js: true do

      visit root_path

      skip_under_construction

      expect(page).to have_content("SIGN IN CANDIDATO")

      has_button?("SIGN IN CANDIDATO")
      click_on("SIGN IN CANDIDATO")

      within "#new_user" do
        fill_in "user_email", with: 'example@email.com'
        fill_in "user_password", with: 'Asdf1234'
        has_button?("INICIAR SESIÓN")
        find("span", text: "Iniciar sesión", visible: false).click
      end

      expect(current_path).to eq(user_path("#{User.last.id}"))
    end
    
    scenario "the user want to come back to home page", js: true do
      visit root_path

      skip_under_construction

      expect(page).to have_content("SIGN IN CANDIDATO")

      has_button?("SIGN IN CANDIDATO")
      click_on("SIGN IN CANDIDATO")
      save_page("page.html")
      page.first(".ht-image").click
     
      expect(page).to have_text("El empleo ideal para tu tiempo libre") 
      expect(current_path).to eq(root_path)
    end
  end
end
