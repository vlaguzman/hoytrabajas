require 'rails_helper'

RSpec.describe "like new company", :type => :feature do
  feature "When click on 'Completar mi perfil'" do

    let(:company) { create(:company, :first_time ) }

    scenario "Should redirect to 'dashboard'", js: true do
      sign_in company

      visit companies_first_offer_step_eight_path

      find(:button, text: 'Completar mi perfil').click

      #TODO uncomment when company dashboard controller exist
      #expect(current_path).to eq(companies_dashboard)

      expect(current_path).to eq(company_path(company))
    end
  end
end