#TODO: this spec should be removed once react is fully integrated

require 'rails_helper'
RSpec.describe "Overall navigation" do
  context "an anonimous user visits the public pages" do
    scenario "all pages render properly", js: true, type: :feature do
      visit root_path
      save_screenshot("gabriel.png")
      menu = find("div.MuiToolbar-root.MuiToolbar-regular.d-flex.justify-content-start.w-100.px-20.pb-0", visible: false)

      within menu do
        expect(page).to have_content("INICIO")
        has_button?("INICIO")
        #find("span", text: "Inicio").click
        click_on("Inicio")
      end

      expect(current_path).to eq(root_path)

      expect(page).to have_link("FAQs", href: faqs_path)
      click_on("FAQs")
      expect(page).to have_text("Faqs")
      click_on("Inicio")

      expect(page).to have_link("Candidato", href: new_user_registration_path)
      click_on("Candidato")
      expect(page).to have_text("Regístrate ahora")
      click_on("Inicio")

      expect(page).to have_link("Empleador", href: new_company_registration_path)
      click_on("Empleador")
      expect(page).to have_text("Regístrate ahora")
      click_on("Inicio")
      
      expect(current_path).to eq(root_path)
      expect(page).to have_link("VER MÁS OFERTAS", href: offers_path)
      expect(current_path).to eq(offers_path) 
      click_on("ver más ofertas")
      expect(page).to have_text("Offers")
      click_on("Inicio")

      expect(page).to have_link("Categorias de empleo", href: job_categories_path)
      click_on("Categorias de empleo")
      expect(page).to have_text("Categorias de empleo")
      click_on("Inicio")

      expect(page).to have_link("Empresas", href: companies_path)
      click_on("Empresas")
      expect(page).to have_text("Empresas")
      click_on("Inicio")

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
