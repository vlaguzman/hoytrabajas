require 'rails_helper'

RSpec.describe "Like an user", type: :feature do

  let(:user)           { create(:user) }
  let(:job_category_1) { create(:job_category, description: "sales") }
  let(:job_category_2) { create(:job_category, description: "marketing") }
  let(:company)        { create(:company, name: "the great company", description: "the best company to work", web_site: "thebestcompany.com") }
  let!(:show_offer)    { create(:offer, company: company, address: "calle falsa 123", job_categories: [job_category_1, job_category_2]) }

  context "when user arrives to offer show" do
    context "when offer has all information to first block" do

      scenario "should render offers show template with the first block data and two job categories", js: true do
        show_offer.sexes << FactoryBot.create(:sex)
        FactoryBot.create(:languages_offers, offer: show_offer)
        show_offer.save

        sign_in user
        visit offer_path(show_offer.id)

        expect(page).to have_text("sales")
        expect(page).to have_text("marketing")

        expect(page).to have_text("Número de vacantes")
        expect(page).to have_text("Residente en")
        expect(page).to have_text("Experiencia")
        expect(page).to have_text("Manejo del idioma")
      end
    end

    context "when offer has all information to second block" do

      let!(:offer_salary) { create(:offer_salary, offer: show_offer) }

      scenario "should render offers show template with the second data", js: true do
        show_offer.offer_type          = FactoryBot.create(:offer_type)
        show_offer.work_mode           = FactoryBot.create(:work_mode)
        show_offer.contract_type       = FactoryBot.create(:contract_type)
        show_offer.available_work_days = [FactoryBot.create(:available_work_day)]
        show_offer.working_days        = [FactoryBot.create(:working_day)]
        show_offer.job_aids            = [FactoryBot.create(:job_aid)]

        show_offer.save

        sign_in user
        visit offer_path(show_offer.id)

        expect(page).to have_text("Tipo de oferta")
        expect(page).to have_text("Modalidad de trabajo")
        expect(page).to have_text("Acuerdo Legal")
        expect(page).to have_text("Jornada")
        expect(page).to have_text("Auxilios o prestaciones")
      end
    end

    context "when offer has not to much information" do

      let(:empty_offer) { create(:offer, :empty, job_categories: [job_category_1, job_category_2]) }

      scenario "should render offers show template as well", js: true do
        sign_in user

        visit offer_path(empty_offer.id)

        expect(page).to have_text("Número de vacantes")
        expect(page).to have_text("Residente en")
        expect(page).to have_text("Experiencia")
        expect(page).to have_text("Tipo de oferta")
        expect(page).to have_text("Modalidad de trabajo")
        expect(page).to have_text("Acuerdo Legal")
        expect(page).to have_text("Salario")
        expect(page).to have_text("Días")
        expect(page).to have_text("Jornada")
        expect(page).to have_text("Auxilios o prestaciones")
      end
    end

    context "when company has all information" do
      scenario "should show all the company data", js: true do
        sign_in user
        visit offer_path(show_offer.id)

        expect(page).to have_text("the great company")
        expect(page).to have_text(show_offer.company.employees_range_description)
        expect(page).to have_text("the best company to work")
        expect(page).to have_text("thebestcompany.com")
      end
    end

    context "when company has not the principal information" do
      scenario "should dont show the company data, but should load the page", js: true do
        empty_company = FactoryBot.create(:company, description: nil, web_site: nil)
        company.employees_range = nil

        company.save
        show_offer.company = empty_company

        show_offer.save

        sign_in user
        visit offer_path(show_offer.id)

        expect(page).to have_text(show_offer.title)
      end
    end

    context "when offer is confidential" do
      scenario "should render only description of company", js: true do
        show_offer.update(confidential: true)
        show_offer.reload

        sign_in user
        visit offer_path(show_offer.id)

        expect(page).to have_text("the best company to work")
        expect(page).to have_text('1-10 empleados')

        expect(page).to_not have_text("the great company")
        expect(page).to_not have_text("calle falsa 123")
        expect(page).to_not have_text("thebestcompany.com")
      end
    end
  end
end
