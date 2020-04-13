#TODO: this spec should be removed once react is fully integrated

require 'rails_helper'

RSpec.describe "Overall navigation", vcr: true do
  context "an anonimous user visits the public pages" do
    before { create(:offer) }

    context "all pages render properly", type: :feature do

      let(:job_category) { create(:job_category) }

      let(:create_stuffed_offers) {
        create(:offer, title: "Esta oferta deberia aparecer")
        create_list(:offer, 24, job_categories: [job_category])
      }

      it "should visit inicio from root_path", js:true do
        Offer.import

        visit root_path

        expect(page).to have_content("Inicio")
        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end

      it "should visit ‘FAQ’ page from home page", js: true do
        Offer.import

        visit root_path

        expect(page).to have_link("FAQs", href: faqs_path)

        click_on("FAQs")

        expect(page).to have_content("Faqs")

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end

      it "should visit Candidato page from home page", js: true do
        Offer.import

        visit root_path

        expect(page).to have_content("Registrarme")
        find('.a-navOpenSignUp', text:/Registrarme/, visible: false).click

        expect(find('h5', text: '¡Hola! Regístrate ahora', visible: false)).to be_present
        find(".modalCloseIcon__button", match: :first, visible: false).click

        expect(current_path).to eq(root_path)
      end

      it "should visit 'Registrarme' page from home page", js: true do
        Offer.import

        visit root_path

        find('.a-navOpenSignUp', text:/Registrarme/, visible: false).click

        expect(find('h5', text: '¡Hola! Regístrate ahora', visible: false)).to be_present
        find(".modalCloseIcon__button", match: :first, visible: false).click
      end

      it "should visit 'ver mas ofertas' page from home page", js: true do
        Offer.import

        create_stuffed_offers

        visit root_path

        find(".loadMoreOffers", visible: false).click

        find(".loadMoreOffers", visible: false).click

        expect(current_path).to eq(offers_path)

        find(".loadMoreOffers", visible: false).click

        find(".loadMoreOffers", visible: false).click

        expect(page).to have_content("Esta Oferta Deberia Aparecer")

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'Offers' page from footer in home page", js: true do
        Offer.import

        visit root_path

        expect(page).to have_link("Buscar ofertas", href: offers_path)

        click_on("Buscar ofertas")

        expect(current_path).to eq(offers_path)

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'Companies' page from footer in home page", js: true do
        Offer.import

        visit root_path

        expect(page).to have_link("Compañías", href: companies_path)

        click_on("Compañías")

        expect(page).to have_content(/Muchas empresas confían en nosotros/)
        expect(page).to have_content(/el talento de su empresa/)

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end
    end
  end
end
