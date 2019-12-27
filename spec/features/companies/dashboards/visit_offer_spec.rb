require 'rails_helper'

RSpec.describe "Like a company", type: :feature do

  feature "I want to visit my created offer from dashboards offers list" do
    let(:company) { create(:company) }
    let!(:create_selctable_offer) { create(:offer, title: "Selectable offer", company: company) }

    scenario "should visit the selected offer", js: true do
      sign_in company

      visit companies_dashboard_path

      find('a', text:'Selectable offer').click

      expect(current_path).to eq(companies_list_candidate_path(create_selctable_offer))
    end
  end
end