require 'rails_helper'

RSpec.describe "User can Log In", type: :feature do

  before {
    create(:user, email: "example@email.com", password: "Asdf1234")  
  }

  context "a registered user must be able to login" do
    scenario "redirect after login", js: true do

      visit root_path

      expect(page).to have_content("Login")

      has_button?("Login")
      click_on("Login")

      within "#new_user" do
        fill_in "user_email", with: 'example@email.com'
        fill_in "user_password", with: 'Asdf1234'
        has_button?("INICIAR SESIÓN")
        click_on("Iniciar Sesión")
      end

      expect(current_path).to eq(user_path("#{User.last.id}"))
    end
  end
end
