require 'rails_helper'

RSpec.describe "Admin can edit an Company",js: true, type: :feature do
  include Devise::Test::IntegrationHelpers

  context "an admin user must be able to edit a created company" do
    
    let!(:company) { create(:company, name: 'rocknroll', email: 'rocknroll@company.com') }

    scenario "the admin select a company and edit all the data" do
      
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path 
      expect(page).to have_content("Active Admin")

      has_button?("Companies")
      click_on("Companies")

      expect(page).to have_content("rocknroll@company.com")
      has_button?("Editar")
      click_on("Editar")
      expect(page).to have_content("Editar Company")

      within '#edit_company' do
        fill_in 'company_name', with: 'rootnpool'
        fill_in 'company_email', with: 'rootnpool@company.com'
        fill_in 'company_password', with: 'ontherocks'
        fill_in 'company_password_confirmation', with: 'ontherocks'
        save_screenshot("pass.png")
        click_on("Guardar Company")
        save_screenshot("admin.png")
      end

      company.reload

      expect(page).to have_content("Detalles de Company")
      expect(page).to have_content("rootnpool@company.com")

      expect(company.email).to eq("rootnpool@company.com")
    end

    scenario "the admin select an user and edit just the email" do
      
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path 
      expect(page).to have_content("Active Admin")
      click_on("Companies")

      expect(page).to have_content("rocknroll@company.com")
      click_on("Editar")
      expect(page).to have_content("Editar Company")

      within '#edit_company' do
        fill_in 'company_email', with: 'justanotheremail@company.com'
        click_on("Guardar Company")
      end
      save_screenshot("admin2.png")

      company.reload

      expect(page).to have_content("Detalles de Company")
      expect(page).to have_content("justanotheremail@company.com")

      expect(company.email).to eq("justanotheremail@company.com")
      Company.destroy_all
    end
  end
end
