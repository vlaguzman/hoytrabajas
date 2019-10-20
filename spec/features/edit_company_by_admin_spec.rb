require 'rails_helper'

RSpec.describe "Admin can edit an User", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "a admin user must be able to edit a created user" do
    
    let!(:user) { create(:user, name: 'carlos', email: 'elcarlos@gmail.com') }

    scenario "the admin select an user and edit all the data" do
      
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path 
      expect(page).to have_content("Active Admin")

      has_button?("Users")
      click_on("Users")

      expect(page).to have_content("elcarlos@gmail.com")
      has_button?("Editar")
      click_on("Editar")
      expect(page).to have_content("Editar User")
      expect(page).to have_content("Email")

      within '#edit_user' do
        fill_in 'user_name', with: 'roberto'
        fill_in 'user_last_name', with: 'carlos'
        fill_in 'user_email', with: 'carlosr@gmail.com'
        fill_in 'user_password', with: 'jogabonito'
        fill_in 'user_password_confirmation', with: 'jogabonito'
        click_on("Guardar User")
      end

      expect(page).to have_content("Detalles de User")
      expect(page).to have_content("carlosr@gmail.com")

      expect(User.last.email).to eq("carlosr@gmail.com")
    end

    scenario "the admin select an user and edit just the email" do
      
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path 
      expect(page).to have_content("Active Admin")
      click_on("Users")

      expect(page).to have_content("elcarlos@gmail.com")
      click_on("Editar")
      expect(page).to have_content("Editar User")

      within '#edit_user' do
        fill_in 'user_email', with: 'eldoncarlos@gmail.com'
        click_on("Guardar User")
      end

      expect(page).to have_content("Detalles de User")
      expect(page).to have_content("eldoncarlos@gmail.com")

      expect(User.last.email).to eq("eldoncarlos@gmail.com")
      User.destroy_all
    end
  end
end
