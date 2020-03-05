require 'rails_helper'

RSpec.describe "like a company", type: :feature do
  describe "visit a offer" do

    let(:hoy_trabajas_company) { create(:company) }
    let(:the_offer) { create(:offer, company: hoy_trabajas_company) }

    feature "when whant edit a offer" do
      scenario "should can see the edit button", js: true do
        sign_in hoy_trabajas_company

        visit offer_path(the_offer)

        expect(page).to have_text('Editar oferta')
      end
    end
  end
end