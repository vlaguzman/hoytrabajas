require 'rails_helper'

def skip_under_construction
  find("button[id='home-welcome-modal']", visible: false).click
  execute_script "window.scrollTo(0, (window.innerHeight * 2))"
end

RSpec.describe "see offers at home", type: :feature, js: true do
  context "like not logged user" do
    context "there are not any offers" do
      it "should show me a message: there are not offers" do
        visit root_path

        skip_under_construction

        expect(Offer.count).to eq(0)	
        expect(page).to have_text("No hay ningún trabajo en este momento")
      end
    end

    context "The offer has a title (>26), a description (>58) and a company name (>31) too long" do
      it "Should render home#index and shorten the text" do
        company = FactoryBot.create(:company, name: "the name of the company is too long")
        offer = FactoryBot.create(:offer, 
                                   title: 'the title of the offer is too long', 
                                   description: 'the description of the offer actually is to long, really long',
                                   company: company)

        visit root_path

        skip_under_construction

        expect(page).to have_text("The Name Of The Company Is Too ...")
        expect(page).to have_text("The Title Of The Offer Is ...")
        expect(page).to have_text("The Description Of The Offer Actually Is To Long, Really L...")
      end
    end

    context "there are some active and some expired offers" do
      it "should show me just the not expired offers" do
        offer = FactoryBot.create(:offer, title: 'active_offer')
        expired_offer = FactoryBot.create(:offer, :expired_offer, title: 'expired_offer')

        visit root_path

        skip_under_construction

        expect(Offer.count).to eq(2)	
        expect(page).to have_text(offer.title.capitalize)
        expect(page).not_to have_text(expired_offer.title.capitalize)
      end
    end 
    
    context "There are one not required_experience offer" do
      it "should show me a message 'Sin Experiencia'" do
        offer = FactoryBot.create(:offer, :no_required_experience_offer, title: 'active_offer_no_experience')

        visit root_path

        skip_under_construction

        expect(page).to have_text(offer.title.capitalize)
        expect(page).to have_text("SIN EXPERIENCIA")
        expect(page).not_to have_text("INICIO INMEDIATO")
      end
    end

    context "There are inmediate_start offer" do
      it "should show me a message 'INICIO INMEDIATO'" do
        offer = FactoryBot.create(:offer, :immediate_start_offer, title: 'offer_inmediate_start')

        visit root_path

        skip_under_construction

        expect(page).to have_text(offer.title.capitalize)
        expect(page).to have_text("INICIO INMEDIATO")
        expect(page).not_to have_text("SIN EXPERIENCIA")
      end
    end

    context "there are a new offer" do
      it "should show me the new flag" do
        offer = FactoryBot.create(:offer, title: 'new_offer')
	
        visit root_path

        skip_under_construction

        expect(page).to have_text(offer.title.capitalize)
        expect(page).to have_text("Nuevo")
      end
    end

    context "there are an old offer" do
      it "should dont show me the new flag" do
        offer = FactoryBot.create(:offer, title: 'old_offer')
        offer.created_at = 3.days.ago
        offer.save!

        visit root_path

        skip_under_construction

        expect(Offer.count).to eq(1)
        expect(page).to have_text(offer.title.capitalize)
        expect(page).not_to have_text("Nuevo")
      end
    end

  end
end
