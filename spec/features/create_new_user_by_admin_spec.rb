require 'rails_helper'

RSpec.describe "Admin can create an User", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "a admin user must be able to create a new user" do
    scenario "the admin fill all the data" do

      User.destroy_all
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path 
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
