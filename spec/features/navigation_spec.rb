#TODO: this spec should be removed once react is fully integrated

require 'rails_helper'

RSpec.describe "Overall navigation" do
  context "an anonimous user visits the public pages" do
    before { create(:offer) }

    context "all pages render properly", type: :feature do
      it "should visit inicio from root_path", js:true do

        visit root_path

        menu = find("div.MuiToolbar-root.MuiToolbar-regular.d-flex.justify-content-start.w-100.px-20.pb-0", visible: false)

        within menu do
          expect(page).to have_content("INICIO")

          click_on("Inicio")
        end

        expect(current_path).to eq(root_path)
      end

      it "should  viit ‘FAQ’ page from home page" do
        visit root_path

        expect(page).to have_link("FAQs", href: faqs_path)

        click_on("FAQs")

        expect(page).to have_text("Faqs")

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end

      it "should visit Candidato page from home page", js: true do
        visit root_path

        expect(page).to have_link("Candidato", href: new_user_registration_path)

        click_on("Candidato")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'Empleador' page from home page", js: true do
        visit root_path

        expect(page).to have_link("Empleador", href: new_company_registration_path)

        click_on("Empleador")

        expect(page).to have_text("Regístrate ahora")

        #TODO the user cant return by easy way to home, should exist a return home button
        visit root_path
      end

      it "should visit 'ver mas ofertas' page from home page", js: true do
        visit root_path

        has_button?("VER MÁS OFERTAS")
        click_on("ver más ofertas")

        expect(current_path).to eq(offers_path)
        expect(page).to have_text("VER MÁS OFERTAS")

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'categorias de empĺeo' page from home page" do
        visit root_path

        expect(page).to have_link("Categorias de empleo", href: job_categories_path)

        click_on("Categorias de empleo")

        expect(page).to have_text("Categorias de empleo")

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end

      it "should visit 'empresas' page from home page" do
        visit root_path

        expect(page).to have_link("Empresas", href: companies_path)

        click_on("Empresas")

        expect(page).to have_text(/Ellos hoy confian en nosotros/)
        expect(page).to have_text(/para encontrar su empleado ideal/)

        click_on("Inicio")

        expect(current_path).to eq(root_path)
      end
    end
  end
end
=begin
Página registro	/app/registration

Dashboard candidato	[username]/dashboard

Dashboard empresa	/companies/[id]/dashboard

Resultado búsqueda por ciudad	/jobs-[city]
	/empleo-[ciudad]
Resultado búsqueda por modalidad	/empleo-[modalidad]
	/jobs-[work-mode]
Resultado búsqueda por tipo	/empleo-[tipo]
	/jobs-[offer-type]
=end
