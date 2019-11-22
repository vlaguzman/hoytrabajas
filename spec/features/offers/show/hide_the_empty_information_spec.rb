#encoding: utf-8
require 'rails_helper'

RSpec.describe "hide the empty information", type: :feature, js: :true do

  let!(:user) { create(:user) }
  let(:job_category) { create(:job_category, description: "sales") }
  let(:job_category_b) { create(:job_category, description: "marketing") }

  let!(:show_offer) { create(:offer, job_categories: [job_category, job_category_b]) }

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

    it "should render offers show template with the second data" do
      FactoryBot.create(:offer_salary, offer: show_offer)
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
      expect(page).to have_text("Días")
    end
  end

  context "the offer has not to much information" do
    it "should render offers show template as well" do
      empty_offer = FactoryBot.create(:offer, vacancies_quantity: nil, city: nil, required_experience: nil, 
				              job_categories: [job_category, job_category_b])
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
end
