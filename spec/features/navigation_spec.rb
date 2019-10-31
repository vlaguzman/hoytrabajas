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

        expect(page).to have_text("Faqs")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit Candidato page from home page", js: true do
        visit root_path

        expect(page).to have_link("SIGN UP CANDIDATO", href: "/users/sign_up")

        click_on("SIGN UP CANDIDATO")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'Empleador' page from home page", js: true do
        visit root_path

        expect(page).to have_link("SIGN UP EMPRESA", href: "/companies/sign_up")

        click_on("SIGN UP EMPRESA")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'ver mas ofertas' page from home page", js: true do
        FactoryBot.create(:offer, title: "Titulo De Oferta")
        FactoryBot.create(:offer, title: "Titulo De Oferta41")
        FactoryBot.create(:offer, title: "Titulo De Oferta52")
        FactoryBot.create(:offer, title: "Titulo De Oferta63")
        FactoryBot.create(:offer, title: "Titulo De Oferta74")
        FactoryBot.create(:offer, title: "Titulo De Oferta85")
        FactoryBot.create(:offer, title: "Titulo De Oferta26")
        FactoryBot.create(:offer, title: "Titulo De Oferta37")
        FactoryBot.create(:offer, title: "Titulo De Oferta48")
        FactoryBot.create(:offer, title: "Titulo De Oferta59")
        FactoryBot.create(:offer, title: "Titulo De Oferta60")
        FactoryBot.create(:offer, title: "Titulo De Oferta71")
        FactoryBot.create(:offer, title: "Titulo De Oferta82")
        FactoryBot.create(:offer, title: "Titulo De Oferta55")
        FactoryBot.create(:offer, title: "Titulo De Oferta84")
        FactoryBot.create(:offer, title: "Titulo De Oferta83")

        visit root_path

        has_button?("VER MÁS OFERTAS »")
        click_on("Ver más ofertas »")

        has_button?("VER MÁS OFERTAS »")
        click_on("Ver más ofertas »")

        expect(page).to have_text("Titulo De Oferta48")
        
        has_button?("VER EL LISTADO DE OFERTAS »")
        click_on("Ver el listado de ofertas »")

        expect(current_path).to eq(offers_path)
        expect(page).to have_text("VER MÁS OFERTAS")
        expect(page).to have_text("Titulo De Oferta48")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'categorias de empĺeo' page from home page", js: true do
        visit root_path

        expect(page).to have_link("Categorias de empleo", href: job_categories_path)

        click_on("Categorias de empleo")

        expect(page).to have_text("Categorias de empleo")

        click_on("INICIO")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'empresas' page from home page", js: true do
        visit root_path

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
