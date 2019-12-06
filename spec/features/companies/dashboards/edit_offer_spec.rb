require 'rails_helper'

RSpec.describe "Like a company", type: :feature do

  feature "I want to edit my offer from dashboard offers list" do
    let(:company) { create(:company) }
    let!(:create_selctable_offer) { create(:offer, title: "Selectable offer", company: company) }

    scenario "should edit the selected offer", js: true do
      sign_in company

      visit companies_dashboard_path

      edit_path = "#{companies_first_offer_step_three_path}?offer_id=#{create_selctable_offer.id}"

      find("a[href='#{edit_path}']", visible: false).click

      find("textarea[name='offer[title]']").set("")
      find("textarea[name='offer[title]']").set("Titulo Editado ajam")

      click_link_or_button('Siguiente')

      visit companies_first_offer_step_eight_path

      find(:button, text: 'Ir al Dashboard').click

      expect(find("a", text: 'Titulo Editado ajam', visible: false)).to be_present
    end
  end
end