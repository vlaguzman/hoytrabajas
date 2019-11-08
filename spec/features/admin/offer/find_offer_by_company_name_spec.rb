require 'rails_helper'

RSpec.describe "like an admin user", :type => :feature do
  let(:admin) { create(:admin_user) }
  let!(:company) { create(:company, name: 'hoycamellas') }

  let!(:create_offers) { create_list(:offer, 5)}
  let!(:objective_offer) { create(:offer, company: company) }

  feature "When I search a offer by company name" do
    scenario "Should see the offer " do
      sign_in admin

      visit admin_offers_path

      create_offers.each do |offer|
        expect(page).to have_content(offer.title)
      end

      fill_in 'q[company_name_contains]', with: company.name

      click_button 'Filtrar'

      create_offers.each do |offer|
        expect(page).to_not have_content(offer.title)
      end

      expect(page).to have_content(objective_offer.title)
    end
  end
end
