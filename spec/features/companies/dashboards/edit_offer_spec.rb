require 'rails_helper'

RSpec.describe "Like a company", type: :feature do

  feature "I want to edit my offer from dashboard offers list" do
    let(:company) { create(:company) }
    let!(:create_selctable_offer) { create(:offer, title: "Selectable offer", company: company) }

    scenario "should edit the selected offer", js: true do
      sign_in company

      visit companies_dashboard_path

      edit_path = "#{companies_first_offer_step_three_path}?offer_id=#{create_selctable_offer.id}"

      find("a[href='#{edit_path}']").click

      fill_in 'offer[title]', :with => "Titulo Editado ajam"

      click_link_or_button('Siguiente')
      click_link_or_button('Siguiente')
      click_link_or_button('Siguiente')
      click_link_or_button('Siguiente')
      click_link_or_button('Publicar')

      find(:button, text: 'Ir al Dashboard').click
      expect(page).to have_content(/Titulo Editado ajam/)
    end
  end
end