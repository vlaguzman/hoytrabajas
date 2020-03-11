require 'rails_helper'

RSpec.describe "like an admin user", type: :feature do
  let(:admin) { create(:admin_user) }
  let!(:job_category) { create(:job_category, description: 'Marketing') }
  let!(:company) { create(:company, name: 'hoycamellas') }

  feature "When I create a offer" do
    scenario "Should see the companies order by name" do
      sign_in admin

      visit new_admin_offer_path

      fill_in "offer[title]", with: "el titulo de la oferta"
      fill_in "offer[description]", with: "la descripcion de la oferta"
      fill_in "offer[company_id]", with: company.id
      select 'Marketing', from: 'offer[job_category_ids][]'
      select 'active', from: 'offer[status]'

      click_button 'Guardar Offer'

      expect(Offer.count).to_not be_zero
      expect(Offer.last.job_categories.count).to eq(1)
      expect(page).to have_content(/el titulo de la oferta/)
      expect(page).to have_content(/hoycamellas/)
    end
  end
end
