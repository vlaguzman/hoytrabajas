require 'rails_helper'

RSpec.describe "Admin can create an User", type: :feature do
  before {
    create(:admin_user, email: "admin@email.com", password: "admin1234")
  }
  context "a admin user must be able to create a new user" do
    scenario "the admin fill all the data" do

      visit new_admin_user_session_path
      expect(page).to have_content("Log in")
      within "#new_admin_user" do
        fill_in "admin_user_email", with: 'admin@email.com'
        fill_in "admin_user_password", with: 'admin1234'
        has_button?("Log in")
        click_on("Log in")
      end
      expect(page).to have_content("Active Admin")

      has_button?("Users")
      click_on("Users")
      has_button?("Añadir")
      click_on("Añadir")

      expect(page).to have_content("Añadir User")

      within '#new_user' do
        fill_in 'user_name', with: 'roberto'
        fill_in 'user_last_name', with: 'carlos'
        fill_in 'user_email', with: 'carlosr@gmail.com'
        fill_in 'user_password', with: 'jogabonito'
        fill_in 'user_password_confirmation', with: 'jogabonito'
        click_on 'Guardar User'
      end

      expect(page).to have_content("Detalles de User")
      expect(page).to have_content("carlosr@gmail.com")

      expect(User.count).to eq(1)
      expect(User.last.email).to eq("carlosr@gmail.com")
    end
  end
end
