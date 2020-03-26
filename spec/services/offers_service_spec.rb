require "rails_helper"
include ActionView::Helpers::NumberHelper

RSpec.describe OffersService do

  describe "#active_offers_index_details" do
    context "When exist active offers" do
      let!(:offer) { create(:offer, status: "active") }

      it "should return the presenter of all active offers" do
        response = subject.active_offers_index_details

        expect(response).to be_present
        expect(response.length).to eq(1)
      end
    end

    context "When active offers are not present" do
      it "should return a empty array" do
        expect(subject.active_offers_index_details).to be_empty
      end
    end
  end

  describe "#related_offers_show_details" do
    let!(:related_job_category) { create(:job_category, description: "AJobCategoryLol") }
    let(:main_offer) { create(:offer, job_categories: [related_job_category]) }

    context "When is needed show related offers by job category" do

      let!(:stuff_offers) do
        [
          create_list(:offer, 5, job_categories: [related_job_category])
        ]
      end

      it "Should return maximun five presenter offers" do
        expect(subject.related_offers_show_details(main_offer.id, main_offer.job_categories).length).to eq(5)
      end

      it "Should return hash with details" do
        expect(subject.related_offers_show_details(main_offer.id, main_offer.job_categories).last.keys).to match_array([:applied_offers, :raw_close_date,
          :affinity_percentage, :id, :city, :close_date, :company, :description, :immediate_start, :confidential, :job_category_image, :new_offer, :required_experience, :salary, :title, :on_demand
        ])
      end
    end

    context "when in the related offers are some applied offer" do

      let(:user)                  { create(:user) }
      let!(:new_curriculum)       { create(:curriculum_vitae, user_id: user.id) }
      let!(:stuff_offers) do
        [
          create_list(:offer, 3, job_categories: [related_job_category])
        ]
      end

      it "should just return the not appliend offers" do
        main_offer = Offer.first
        applied_offer = Offer.last

        expect(subject.related_offers_show_details(main_offer.id, main_offer.job_categories, user).length).to eq(2)
        create(:applied_offer, offer: applied_offer, curriculum_vitae: new_curriculum)
        expect(subject.related_offers_show_details(main_offer.id, main_offer.job_categories, user).length).to eq(1)
      end
    end

    context "when the job category is not present" do
      it "Should return the main offer" do
        expect(subject.related_offers_show_details.length).to be_zero
      end
    end
  end

  describe "#query_offers_home" do
    let!(:job_category)  { create(:job_category) }
    let!(:job_category2) { create(:job_category) }
    let!(:offer)  { create(:offer, description: 'oferta 1', job_categories: [job_category]) }
    let!(:offer2) { create(:offer, description: 'oferta 2', job_categories: [job_category]) }
    let!(:offer3) { create(:offer, description: 'oferta 3', job_categories: [job_category2]) }

    context "When filtering by categories" do
      it "Should return the result by categories" do
        response = subject.query_offers_home(Offer.all, job_category.id.to_s)

        expect(response).to be_present
        expect(response.count).to eq(2)
      end
    end

    context "When filtered only by title and not by categories" do
      it "Should return the original result without filtering" do
        response = subject.query_offers_home(Offer.all, "")

        expect(response).to be_present
        expect(response.count).to eq(3)
      end
    end
  end

end
