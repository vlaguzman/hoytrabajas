#encoding: utf-8
require 'rails_helper'

RSpec.describe "get offers by category from URL", type: :feature do

  before do

    support = create(:job_category, description: "Soporte")
    contruction = create(:job_category, description: "contruccion")
    sales = create(:job_category, description: "Ventas")

    create(:offer, title: 'Gran Oferta Ventas', job_categories: [support, sales])
    create(:offer, title: 'Soporte: Una Super Offerta', job_categories: [support])
    create(:offer, title: 'No busques Más Ofertas', job_categories: [contruction])
  end

  describe "Like a user" do
    context "When visit the path '/offers/job_categories/soporte'" do
      it "Should return the the offers in the medellin city", js: true do

        visit '/offers/job_categories/soporte'

        expect(page).to have_content('Gran Oferta Ventas')
        expect(page).to have_content('Soporte: Una Super Offerta')
        expect(page).to_not have_content('No busques Más Ofertas')
      end
    end
  end

end