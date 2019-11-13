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
          create(:offer, job_categories: [related_job_category]),
          create(:offer),
          create(:offer, job_categories: [related_job_category]),
          create(:offer),
          create(:offer, job_categories: [related_job_category]),
          create(:offer),
          create(:offer, job_categories: [related_job_category]),
          create(:offer),
          create(:offer, job_categories: [related_job_category])
        ]
      end

      it "Should return maximun five presenter offers" do
        expect(subject.related_offers_show_details(main_offer.id, main_offer.job_categories).length).to eq(5)
      end

      it "Should return hash with details" do
        expect(subject.related_offers_show_details(main_offer.id, main_offer.job_categories).last.keys).to match_array([
          :id_offer, :city, :close_date, :company, :description, :immediate_start, :new_offer, :required_experience, :salary, :title
        ])
      end
    end

    context "when the job category is not present" do
      it "Should return the main offer" do
        expect(subject.related_offers_show_details.length).to be_zero
      end
    end
  end
end
