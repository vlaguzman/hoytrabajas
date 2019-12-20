#encoding: utf-8
require 'rails_helper'

RSpec.describe "hide the empty information", type: :feature, js: :true do

  let(:user) { create(:user) }
  let(:job_category) { create(:job_category, description: "sales") }
  let(:job_category_b) { create(:job_category, description: "marketing") }
  let(:company) { create(:company, name: "the great company",
                                   description: "the best company to work", web_site: "thebestcompany.com") }
  let!(:show_offer) { create(:offer, job_categories: [job_category, job_category_b],
                                     company: company, address: "calle falsa 123") }

  context "the offer has all information" do

    let!(:age_range) { create(:age_range, offer: show_offer) }

    it "should render offers show template with the first block data and two job categories" do
      show_offer.sexes << FactoryBot.create(:sex)
      FactoryBot.create(:languages_offers, offer: show_offer)
      show_offer.save

      sign_in user
      visit offer_path(show_offer.id)

      expect(page).to have_text("sales")
      expect(page).to have_text("marketing")

      expect(page).to have_text("Oferta dirigida a")
      expect(page).to have_text("Edad")
      expect(page).to have_text("Número de vacantes")
      expect(page).to have_text("Residente en")
      expect(page).to have_text("Experiencia")
      expect(page).to have_text("Manejo del idioma")
    end
  end

  context "the offer has all information" do
    
    let!(:offer_salary){ create(:offer_salary, offer: show_offer) }

    it "should render offers show template with the second data" do
      show_offer.offer_type = FactoryBot.create(:offer_type)
      show_offer.work_mode = FactoryBot.create(:work_mode)
      show_offer.contract_type = FactoryBot.create(:contract_type)
      show_offer.available_work_days = [FactoryBot.create(:available_work_day)]
      show_offer.working_days = [FactoryBot.create(:working_day)]
      show_offer.job_aids = [FactoryBot.create(:job_aid)]

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

  context "the offer has not to much information" do
    it "should render offers show template as well" do
      empty_offer = FactoryBot.create(:empty_offer, job_categories: [job_category, job_category_b])
      sign_in user
      visit offer_path(empty_offer.id)

      expect(page).to_not have_text("Oferta dirigida a")
      expect(page).to_not have_text("Edad")
      expect(page).to_not have_text("Número de vacantes")
      expect(page).to_not have_text("Residente en")
      expect(page).to_not have_text("Experiencia")
      expect(page).to_not have_text("Tipo de oferta")
      expect(page).to_not have_text("Modalidad de trabajo")
      expect(page).to_not have_text("Acuerdo Legal")
      expect(page).to_not have_text("Salario")
      expect(page).to_not have_text("Días")
      expect(page).to_not have_text("Jornada")
      expect(page).to_not have_text("Auxilios o prestaciones")
    end
  end
  
  context "the company has all information" do
    it "should show all the company data" do
      sign_in user
      visit offer_path(show_offer.id)

      expect(page).to have_text("the great company")
      expect(page).to have_text("calle falsa 123")
      expect(page).to have_text(show_offer.company.employees_range_description)
      expect(page).to have_text("the best company to work")
      expect(page).to have_text("thebestcompany.com")
    end
  end

  context "the company has not the principal information" do
    it "should dont show the company data, but should load the page" do
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
end
