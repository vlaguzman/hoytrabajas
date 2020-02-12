require 'rails_helper'

RSpec.describe "User searches for an offer", type: :feature do

  context "When user search of offer" do
    let!(:job_category)   { create(:job_category, description: 'Operario') }
    let!(:job_category2)  { create(:job_category, description: 'Tecnologia') }
    let!(:job_category3)  { create(:job_category, description: 'Marketing') }
    let!(:job_category4) { create(:job_category, description: 'Servicios') }
    let!(:job_category5) { create_list(:job_category, 7, description: 'Otra categoria') }
    let!(:create_stuff_offers) do
      create_list(:offer, 5, title: "Test sebas", job_categories: [job_category])
      create_list(:offer, 6, title: "Esto es un prueba de sebas", job_categories: [job_category, job_category2])
      create_list(:offer, 7, title: "Que gran oferta sebas!", job_categories: [job_category3])
    end

    context "Visit home" do
      it "Should show the title, carousel and the filter inputs", js: true do
        visit root_path

        expect(page).to have_tag(:form, with: { class: "row justify-content-around" }) do
          with_tag(:input, with: { name: 'q[title_cont]'})
        end

        expect(page).to have_text("Operario")
        expect(page).to have_text("5")
        expect(page).to have_text("Tecnologia")
        expect(page).to have_text("6")
        expect(page).to have_text("Marketing")
        expect(page).to have_text("7")
        expect(page).to have_text("Servicios")
        expect(page).to have_text("0")
      end
    end

    context "When you filter only by offer title" do
      context "When several offers are found" do
        it "Should return offers related", js: true do
          visit root_path

          fill_in('keyword', with: 'sebas')
          find(".filterForm__searchButton", visible: false).click

          expect(current_path).to eq("#{offers_path}/")

          expect(page).to have_content("Que Gran Oferta Sebas!")
          expect(page).to have_content("Esto Es Un Prueba De Sebas")

          find(".loadMoreOffers", visible: false).click

          expect(page).to have_content("Test Sebas")
        end
      end

      context "When you only find a concidence" do
        it "Should return the related offer", js: true do
          visit root_path

          fill_in('keyword', with: 'prueba')
          find(".filterForm__searchButton", visible: false).click

          expect(page).to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to_not have_content("Test Sebas")
          expect(page).to_not have_content("Que Gran Oferta Sebas!")
        end
      end

      context "When no concidence is found" do
        it "Should be redirected to the offers page without any results", js: true do
          visit root_path

          fill_in('keyword', with: 'Jhoan')
          find(".filterForm__searchButton", visible: false).click

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

          find("#Operario").click
          find(".filterForm__searchButton", visible: false).click

          expect(page).to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to have_content("Test Sebas")
          expect(page).to_not have_content("Que Gran Oferta Sebas!")
        end
      end

      context "When you select a category filter" do
        it "Should hide all categories", js: true do
          visit root_path

          find("div[id='Tecnologia']").click
          expect( find('.filterForm__collapseCategories', visible: false)['aria-expanded']).to eq("false")

        end
      end

      context "When you click the categories button" do
        it "Should hide all categories", js: true do
          visit root_path

          find('.filterForm__categoriesButton', visible: false).click

          expect( find('.filterForm__collapseCategories', visible: false)['aria-expanded']).to eq("false")
        end
      end

      context "When you filter by several categories and find results" do
        it "Should return results", js: true do
          visit root_path

          find("div[id='Tecnologia']").click
          find('.filterForm__categoriesButton', visible: false).click

          find("div[id='Marketing']").click
          find(".filterForm__searchButton", visible: false).click

          expect(page).to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
        end
      end

      context "When you filter by categories and find no results" do
        it "Should return message of empty", js: true do
          visit root_path


          find("div[id='Servicios']").click
          find(".filterForm__searchButton", visible: false).click

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

          fill_in('keyword', with: 'oferta')

          find("div[id='Marketing']").click

          find(".filterForm__searchButton", visible: false).click

          expect(page).not_to have_content("Esto Es Un Prueba De Sebas")
          expect(page).to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
        end
      end

      context "When you search by title and category and find no results" do
        it "Should return message of empty", js: true do
          visit root_path

          fill_in('keyword', with: 'jhoan')

          find("div[id='Marketing']").click
          find(".filterForm__searchButton", visible: false).click

          expect(page).not_to have_content("Esto Es Un Prueba de Sebas")
          expect(page).not_to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
        end
      end
    end

    context "When you filter by offer city only" do
      let!(:city_2) { create(:city, description: "Medellin") }
      let!(:city_3) { create(:city, description: "Cali") }
      let!(:offer_query_for_city) { create(:offer,
        description: "Este es el query por ciudad",
        city_id: city_2.id,
        job_categories: [job_category]
      ) }

      context "When you filter by a single city and find results" do
        it "Should return results", js: true do
          visit root_path

          find("input#combo-box-demo", visible: false).set("mede")
          find("div[class='MuiAutocomplete-popper']").click

          find(".filterForm__searchButton", visible: false).click

          expect(current_path).to eq("#{offers_path}/")
          expect(page).to have_content("Este es el query por ciudad")
        end
      end

      context "When you filter by city and find no results" do
        it "Should return message of empty", js: true do
          visit root_path

          find("input#combo-box-demo", visible: false).set("cali")

          expect(page).to have_content("No options")
        end
      end
    end

    context "When you filter by title and offer categories and city" do
      let!(:city_4) { create(:city, description: "Chia") }
      let!(:city_5) { create(:city, description: "Cajica") }
      let!(:offer_query_for_city_2) { create(:offer, title: "oferta de sebas", city_id: city_4.id, job_categories: [job_category3]) }

      context "When you search by title and category and city and find results" do
        it "Should return results", js: true do
          visit root_path

          fill_in('keyword', with: 'oferta de sebas')

          find("div[id='Marketing']").click

          find("input#combo-box-demo", visible: false).set("chia")
          find("div[class='MuiAutocomplete-popper']").click

          find(".filterForm__searchButton", visible: false).click

          expect(page).to have_content("Oferta De Sebas")
          expect(page).not_to have_content("Esto Es Un Prueba De Sebas")
          expect(page).not_to have_content("Test Sebas")
        end
      end

      context "When you search by title and category and city and find no results" do
        it "Should return message of empty", js: true do
          visit root_path

          fill_in('keyword', with: 'jhoan')

          find("div[id='Marketing']").click

          find("input#combo-box-demo", visible: false).set("caji")
          find("div[class='MuiAutocomplete-popper']").click

          find(".filterForm__searchButton", visible: false).click

          expect(page).not_to have_content("Esto Es Un Prueba De Sebas")
          expect(page).not_to have_content("Que Gran Oferta Sebas!")
          expect(page).not_to have_content("Test Sebas")
          expect(page).not_to have_content("Esta Oferta Tambien Es De Sebas")
          expect(page).not_to have_content("Oferta De Sebas")
        end
      end
    end
  end
end
