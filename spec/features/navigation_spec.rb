#TODO: this spec should be removed once react is fully integrated

require 'rails_helper'



RSpec.describe "Overall navigation" do
  context "an anonimous user visits the public pages" do
    before { create(:offer) }

    context "all pages render properly", type: :feature do
      it "should visit inicio from root_path", js:true do

        visit root_path

        expect(page).to have_content("INICIO")
        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit ‘FAQ’ page from home page", js: true do
        visit root_path

        expect(page).to have_link("FAQs", href: faqs_path)

        click_on("FAQs")

        expect(page).to have_content("Faqs")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit Candidato page from home page", js: true do
        visit root_path

        expect(page).to have_content("SIGN UP CANDIDATO")
        find('span', text:/SIGN UP CANDIDATO/, visible: false).click

        expect(find('span', text: 'Regístrate ahora', visible: false)).to be_present
        find(".modal--close-icon", match: :first, visible: false).click

        expect(current_path).to eq(root_path)
      end

      it "should visit 'SIGN UP EMPRESA' page from home page", js: true do
        visit root_path

        find('span', text:/SIGN UP EMPRESA/, visible: false).click

        expect(find('span', text: 'Regístrate ahora', visible: false)).to be_present
        find(".modal--close-icon", match: :first, visible: false).click
      end

      it "should visit 'ver mas ofertas' page from home page", js: true do
        job_category = create(:job_category)
        create(:offer, title: "Esta oferta deberia aparecer")
        create_list(:offer, 24, job_categories: [job_category])

        visit root_path

        has_button?('VER MÁS OFERTAS')
        find('span', text:/Ver más ofertas/, visible: false).click

        has_button?('VER EL LISTADO DE OFERTAS')
        find('span', text:/Ver el listado de ofertas/, visible: false).click

        expect(current_path).to eq(offers_path)

        has_button?('VER MÁS OFERTAS')
        find('span', text:/Ver más ofertas/, visible: false).click

        has_button?('VER MÁS OFERTAS')
        find('span', text:/Ver más ofertas/, visible: false).click

        expect(page).to have_content("Esta Oferta Deberia Aparec...")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'categorias de empĺeo' page from home page", js: true do
        visit root_path

        expect(page).to have_link("Categorias de empleo", href: job_categories_path)

        click_on("Categorias de empleo")

        expect(page).to have_content("Categorias de empleo")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'empresas' page from home page", js: true do
        visit root_path

        expect(page).to have_link("Empresas", href: companies_path)

        click_on("Empresas")

        expect(page).to have_content(/Ellos hoy confian en nosotros/)
        expect(page).to have_content(/para encontrar su empleado ideal/)

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end
    end
  end
end
