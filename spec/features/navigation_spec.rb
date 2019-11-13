#TODO: this spec should be removed once react is fully integrated

require 'rails_helper'

def skip_under_construction
  find("button[id='home-welcome-modal']", visible: false).click
  execute_script "window.scrollTo(0, (window.innerHeight * 2))"
end

RSpec.describe "Overall navigation" do
  context "an anonimous user visits the public pages" do
    before { create(:offer) }

    context "all pages render properly", type: :feature do
      it "should visit inicio from root_path", js:true do

        visit root_path

        skip_under_construction

        expect(page).to have_content("INICIO")
        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit ‘FAQ’ page from home page", js: true do
        visit root_path

        skip_under_construction

        expect(page).to have_link("FAQs", href: faqs_path)

        click_on("FAQs")

        expect(page).to have_text("Faqs")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit Candidato page from home page", js: true do
        visit root_path

        skip_under_construction

        expect(page).to have_link("SIGN UP CANDIDATO", href: "/users/sign_up")

        click_on("SIGN UP CANDIDATO")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'Empleador' page from home page", js: true do
        visit root_path

        skip_under_construction

        expect(page).to have_link("SIGN UP EMPRESA", href: "/companies/sign_up")

        click_on("SIGN UP EMPRESA")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'ver mas ofertas' page from home page", js: true do
        create(:offer, title: "Esta oferta deberia aparecer")
        create_list(:offer, 20)

        visit root_path

        skip_under_construction

        has_button?('VER MÁS OFERTAS')
        find('span', text:/Ver más ofertas/, visible: false).click

        has_button?('VER MÁS OFERTAS')
        find('span', text:/Ver más ofertas/, visible: false).click

        has_button?('VER EL LISTADO DE OFERTAS')
        find('span', text:/Ver el listado de ofertas/, visible: false).click

        expect(current_path).to eq(offers_path)

        has_button?('VER MÁS OFERTAS')
        find('span', text:/Ver más ofertas/, visible: false).click

        has_button?('VER MÁS OFERTAS')
        find('span', text:/Ver más ofertas/, visible: false).click

        expect(page).to have_text("Esta Oferta Deberia Aparec...")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'categorias de empĺeo' page from home page", js: true do
        visit root_path

        skip_under_construction

        expect(page).to have_link("Categorias de empleo", href: job_categories_path)

        click_on("Categorias de empleo")

        expect(page).to have_text("Categorias de empleo")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'empresas' page from home page", js: true do
        visit root_path

        skip_under_construction

        expect(page).to have_link("Empresas", href: companies_path)

        click_on("Empresas")

        expect(page).to have_text(/Ellos hoy confian en nosotros/)
        expect(page).to have_text(/para encontrar su empleado ideal/)

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end
    end
  end
end
