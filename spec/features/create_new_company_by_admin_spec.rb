require 'rails_helper'

RSpec.describe "Admin can create a company", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "a admin user must be able to create a new company" do
    scenario "the admin dont fill the password" do
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      has_button?("Companies")
      click_on("Companies")
      has_button?("Añadir Company")
      click_on("Añadir Company")

      expect(page).to have_content("Añadir Company")

      within '#new_company' do
        fill_in 'company_name', with: 'roberto company'
        fill_in 'company_description', with: 'we create the best chicken food of the world'
        fill_in 'company_email', with: 'admin@robertocompany.com'
        click_on 'Guardar Company'
      end

      expect(page).to have_content("Por favor ingrese el password, este campo no puede estar en blanco")

      expect(Company.count).to eq(0)
    end

    scenario "the admin dont fill the email" do
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      has_button?("Companies")
      click_on("Companies")
      has_button?("Añadir Company")
      click_on("Añadir Company")

      expect(page).to have_content("Añadir Company")

      within '#new_company' do
        fill_in 'company_name', with: 'roberto company'
        fill_in 'company_description', with: 'we create the best chicken food of the world'
        fill_in 'company_password', with: 'food4chicken'
        fill_in 'company_password_confirmation', with: 'food4chicken'
        click_on 'Guardar Company'
      end

      expect(page).to have_content("Por favor ingrese un correo electrónico, este campo no puede estar en blanco")

      expect(Company.count).to eq(0)
    end

    scenario "the admin fill all the data" do
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      has_button?("Companies")
      click_on("Companies")
      has_button?("Añadir Company")
      click_on("Añadir Company")

      expect(page).to have_content("Añadir Company")

      within '#new_company' do
        fill_in 'company_name', with: 'roberto company'
        fill_in 'company_description', with: 'we create the best chicken food of the world'
        fill_in 'company_email', with: 'admin@robertocompany.com'
        fill_in 'company_password', with: 'food4chicken'
        fill_in 'company_password_confirmation', with: 'food4chicken'
        click_on 'Guardar Company'
      end

      expect(page).to have_content("Detalles de Company")
      expect(page).to have_content("admin@robertocompany.com")

      expect(Company.count).to eq(1)
      expect(Company.last.email).to eq("admin@robertocompany.com")
      Company.destroy_all
    end

  end
end
