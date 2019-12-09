require 'rails_helper'

RSpec.describe "Admin can create an Offer", type: :feature do
  include Devise::Test::IntegrationHelpers
  let!(:city) { create(:city, description: 'Bogotá') }
  let!(:company) { create(:company, name: 'IBM') }
  let!(:job_category) { create(:job_category, description: 'ventas') }
  let!(:work_mode) { create(:work_mode, description: 'teletrabajo') }
  let!(:contract_type) { create(:contract_type, description: 'prestación de servicios') }

  context "a admin user must be able to create a new offer" do
    scenario "the admin dont fill the title for the company" do
      sign_in create(:admin_user)

      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      has_button?("Offers")
      click_on("Offers")
      has_button?("Añadir Offer")
      click_on("Añadir Offer")

      expect(page).to have_content("Añadir Offer")

      within '#new_offer' do
        select('IBM', from: 'offer_company_id')
        select('ventas', from: 'offer_job_category_ids')
        click_on 'Guardar Offer'
      end

      expect(page).to have_content("Por favor ingrese un título a la oferta, este campo no puede estar en blanco")
      expect(Offer.count).to eq(0)
    end

    scenario "the admin dont select the category data" do
      sign_in create(:admin_user)
      visit admin_dashboard_path 
      expect(page).to have_content("Active Admin")

      has_button?("Offers")
      click_on("Offers")
      has_button?("Añadir Offer")
      click_on("Añadir Offer")

      expect(page).to have_content("Añadir Offer")

      within '#new_offer' do
        fill_in 'offer_title', with: 'ROR Dev'
        select('IBM', from: 'offer_company_id')
        click_on 'Guardar Offer'
      end

      expect(page).to have_content("Por favor seleccione una categoría, este campo es requerido")
      expect(Offer.count).to eq(0)
    end

    scenario "the admin dont select the company data" do
      sign_in create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      click_on("Offers")

      click_on("Añadir Offer")

      expect(page).to have_content("Añadir Offer")

      within '#new_offer' do
        fill_in 'offer_title', with: 'ROR Dev'
        select('ventas', from: 'offer_job_category_ids')
        click_on 'Guardar Offer'
      end

      expect(page).to have_content("Por favor seleccione una compañía, este campo es requerido")
      expect(Offer.count).to eq(0)
    end

    scenario "the admin fill all the data" do
      sign_in create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      click_on("Offers")

      click_on("Añadir Offer")

      expect(page).to have_content("Añadir Offer")

      within '#new_offer' do
        fill_in 'offer_title', with: 'ROR Dev'
        fill_in 'offer_address', with: 'Calle falsa 321'
        fill_in 'offer_cellphone', with: '321 7654321'
        fill_in 'offer_description', with: 'work in the best company of the whole fucking world'
        fill_in 'offer_vacancies_quantity', with: '3'
        select('IBM', from: 'offer_company_id')
        select('ventas', from: 'offer_job_category_ids')
        select('teletrabajo', from: 'offer_work_mode_id')
        select('Bogotá', from: 'offer_city_id')
        select('prestación de servicios', from: 'offer_contract_type_id')
        select('active', from: 'offer_status')
        click_on 'Guardar Offer'
      end

      expect(page).to have_content("ROR Dev")
      expect(page).to have_content("321 7654321")

      expect(Offer.count).to eq(1)
      expect(Offer.last.title).to eq("ROR Dev")
      expect(Offer.last.created_by_admin).to be_truthy
      Offer.destroy_all
    end

  end
end
