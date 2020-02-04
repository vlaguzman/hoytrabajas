require 'rails_helper'

RSpec.describe "see offers at home", type: :feature, js: true do
  context "like not logged user" do
    context "there are not any offers" do
      it "should show me a message: there are not offers" do
        visit root_path

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
          company: company
        )

        visit root_path

        expect(page).to have_text("The Name Of The Company Is Too ...")
        expect(page).to have_text("The title of the offer is ...")
        expect(page).to have_text("The description of the offer actually is to long, really l...")
      end
    end

    context "there are some active and some expired offers" do
      it "should show me just the not expired offers" do
        offer = FactoryBot.create(:offer, title: 'active_offer')
        expired_offer = FactoryBot.create(:offer, :expired_offer, title: 'expired_offer')

        visit root_path

        expect(Offer.count).to eq(2)
        expect(page).to have_text(offer.title.capitalize)
        expect(page).not_to have_text(expired_offer.title.capitalize)
      end
    end

    context "There are one not required_experience offer" do
      it "should show me a message 'Sin experiencia'" do
        offer = FactoryBot.create(:offer, :no_required_experience_offer, title: 'active_offer_no_experience')

        visit root_path

        expect(page).to have_text(offer.title.capitalize)
        expect(page).to have_text("Sin experiencia")
        expect(page).not_to have_text("Inicio inmediato")
      end
    end

    context "There are inmediate_start offer" do
      it "should show me a message 'Inicio inmediato'" do
        offer = FactoryBot.create(:offer, :immediate_start_offer, title: 'offer_inmediate_start')

        visit root_path

        expect(page).to have_text(offer.title.capitalize)
        expect(page).to have_text("Inicio inmediato")
        expect(page).not_to have_text("Sin experiencia")
      end
    end

    context "there are a new offer" do
      it "should show me the new flag" do
        offer = FactoryBot.create(:offer, title: 'new_offer')

        visit root_path

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

        expect(Offer.count).to eq(1)
        expect(page).to have_text(offer.title.capitalize)
        expect(page).not_to have_text("Nuevo")
      end
    end
  end

  describe "Like a logged user" do
    context "When candidate at home" do

      let(:contract_type) { create(:contract_type, description: "Indefinido")}
      let(:offer_contract)  { create(:empty_offer,
        contract_type: contract_type,
        title: "A Super Offer",
        description: 'a super description')}

      let(:curriculum_vitae) { create(:curriculum_vitae,
      job_categories: offer_contract.job_categories
      ) }

      let!(:candidate) { create(:user,
        :first_time_candidate,
        name: "conan",
        contract_type: contract_type,
        curriculum_vitaes: [curriculum_vitae]
      )}

      it "Should see able to see his affinity percentage" do
        sign_in candidate

        visit root_path

        save_page("paps.hmtl")

        expect(page).to have_content("A Super Offer")
        expect(page).to have_content("A super description")
        expect(page).to have_content("100%")
      end
    end
  end
end
