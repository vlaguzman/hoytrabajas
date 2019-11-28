require 'rails_helper'

RSpec.describe "User searches for an offer", type: :feature do
  

  context "When user search of offer" do
    let!(:job_category)  { create(:job_category, description: 'Operario') }
    let!(:job_category2) { create(:job_category, description: 'Tecnologia') }
    let!(:job_category3) { create(:job_category, description: 'Marketing') }
    let!(:job_category4) { create(:job_category, description: 'Servicios') }
    let!(:job_category5) { create_list(:job_category, 7, description: 'Otra categoria') }
    let!(:offer)         { create(:offer, title: "Test sebas", job_categories: [job_category]) }
    let!(:offer1)        { create(:offer, title: "Esto es un prueba de sebas", job_categories: [job_category, job_category2]) }
    let!(:offer2)        { create(:offer, title: "Que gran oferta sebas!", job_categories: [job_category3]) }

    context "When you filter only by offer title" do
      context "When several offers are found" do
        it "Should return offers related", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
            with_tag(:input, with: { name: 'q[title_cont]'})
          end

          fill_in('q[title_cont]', with: 'sebas')
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")
          save_screenshot('sebas.png')

          expect(page).to have_content("Test Sebas")
          expect(page).to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to have_content("Que Gran Oferta Sebas!")
        end
      end

      context "When you only find a concidence" do
        it "Should return the related offer", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
            with_tag(:input, with: { name: 'q[title_cont]'})
          end

          fill_in('q[title_cont]', with: 'prueba')
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")

          expect(page).to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to_not have_content("Test Sebas")
          expect(page).to_not have_content("Que Gran Oferta Sebas!")
        end
      end

      context "When no concidence is found" do
        it "Should be redirected to the offers page without any results", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
            with_tag(:input, with: { name: 'q[title_cont]'})
          end

          fill_in('q[title_cont]', with: 'Jhoan')
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")

          expect(page).to_not have_content("Esto Es Un Prueba De Sebas")
          expect(page).to_not have_content("Test Sebas")
          expect(page).to_not have_content("Que Gran Oferta Sebas!")
        end
      end
    end

    context "When you filter by offer categories only" do
      context "When you filter by a single category and find results" do
        it "Should return results", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          find("button[class='MuiButtonBase-root MuiButton-root text-primary h-50 MuiButton-text']", visible: false).click

          expect(page).to have_content("Operario")
          expect(page).to have_content("2")
          expect(page).to have_content("Tecnologia")
          expect(page).to have_content("1")
          expect(page).to have_content("Marketing")
          expect(page).to have_content("1")
          expect(page).to have_content("Servicios")
          expect(page).to have_content("0")

          find("div[id='Operario']").click
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")

          expect(page).to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to have_content("Test Sebas")
          expect(page).to_not have_content("Que Gran Oferta Sebas!")
        end
      end

      context "When you filter by several categories and find results" do
        it "Should return results", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          find("button[class='MuiButtonBase-root MuiButton-root text-primary h-50 MuiButton-text']", visible: false).click

          expect(page).to have_content("Operario")
          expect(page).to have_content("2")
          expect(page).to have_content("Tecnologia")
          expect(page).to have_content("1")
          expect(page).to have_content("Marketing")
          expect(page).to have_content("1")
          expect(page).to have_content("Servicios")
          expect(page).to have_content("0")

          find("div[id='Tecnologia']").click
          find("div[id='Marketing']").click
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")

          expect(page).to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
        end
      end

      context "When you filter by categories and find no results" do
        it "Should return message of empty", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          find("button[class='MuiButtonBase-root MuiButton-root text-primary h-50 MuiButton-text']", visible: false).click

          expect(page).to have_content("Operario")
          expect(page).to have_content("2")
          expect(page).to have_content("Tecnologia")
          expect(page).to have_content("1")
          expect(page).to have_content("Marketing")
          expect(page).to have_content("1")
          expect(page).to have_content("Servicios")
          expect(page).to have_content("0")

          find("div[id='Servicios']").click
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")

          expect(page).not_to have_content("Esto Es Un Prueba De Sebas")
          expect(page).not_to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
        end
      end
    end

    context "When you filter by title and offer categories" do
      context "When you search by title and category and find results" do
        it "Should return results", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
            with_tag(:input, with: { name: 'q[title_cont]'})
          end

          fill_in('q[title_cont]', with: 'oferta')

          find("button[class='MuiButtonBase-root MuiButton-root text-primary h-50 MuiButton-text']", visible: false).click

          expect(page).to have_content("Operario")
          expect(page).to have_content("2")
          expect(page).to have_content("Tecnologia")
          expect(page).to have_content("1")
          expect(page).to have_content("Marketing")
          expect(page).to have_content("1")
          expect(page).to have_content("Servicios")
          expect(page).to have_content("0")

          find("div[id='Marketing']").click
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")

          expect(page).not_to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
        end
      end

      context "When you search by title and category and find no results" do
        it "Should return message of empty", js: true do
          visit root_path

          expect(page).to have_content("El empleo ideal para tu tiempo libre")

          expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
            with_tag(:input, with: { name: 'q[title_cont]'})
          end

          fill_in('q[title_cont]', with: 'jhoan')

          find("button[class='MuiButtonBase-root MuiButton-root text-primary h-50 MuiButton-text']", visible: false).click

          expect(page).to have_content("Operario")
          expect(page).to have_content("2")
          expect(page).to have_content("Tecnologia")
          expect(page).to have_content("1")
          expect(page).to have_content("Marketing")
          expect(page).to have_content("1")
          expect(page).to have_content("Servicios")
          expect(page).to have_content("0")

          find("div[id='Marketing']").click
          find("button[class='MuiButtonBase-root MuiFab-root mb-10 search_button text-white MuiFab-primary']", visible: false).click

          #This expect is done like this because capybara doesn't understand query strings
          expect(current_path).to eq("#{offers_path}/")

          expect(page).not_to have_content("Esto Es Un Prueba De Sebas")
          expect(page).not_to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
        end
      end
    end
  end
end
