require "rails_helper"

RSpec.describe OffersPresenter do
  let(:offer) { create(:offer) }
  let(:subject) { described_class.new(offer) }

  describe "#show_details" do
    it { should respond_to(:show_details) }

    it "should return a hash with the required info to show template" do
      expect(subject.show_details).to be_an_instance_of(Hash)
    end
  end

  describe "#related_offer_show" do
    it { should respond_to(:related_offer_show) }

    it "should return a hash with the required info to show template" do
      expect(subject.related_offer_show).to be_an_instance_of(Array)
    end

    context "when exist 3 related offers" do
      let!(:main_job_category) { create(:job_category, id: 88, description: "TheMainCategory") }

      let(:main_offer) { create(:offer, job_category: main_job_category) }

      let!(:related_offer_one)   { Offers::IndexService.new(create(:offer, job_category_id: 88)).details }
      let!(:related_offer_two)   { Offers::IndexService.new(create(:offer, job_category_id: 88)).details }
      let!(:related_offer_three) { Offers::IndexService.new(create(:offer, job_category_id: 88)).details }

      let!(:stuff_offers) do
        [create(:offer), create(:offer)]
      end

      let(:subject) { described_class.new(main_offer) }

      it "should return 3 expected objects" do

        response = subject.related_offer_show

        expected_response = [
          related_offer_one,
          related_offer_two,
          related_offer_three
        ]

        expect(response.length).to eq(3)
        expect(response).to match_array(expected_response)
      end
    end
  end

  describe "#index_details" do
    it { should respond_to(:index_details) }

    it "should return a array with the required info to show template" do
      response = subject.related_offer_show

      expect(response).to be_an_instance_of(Array)
    end

    let!(:related_offer) { create(:offer, job_category: subject.job_category) }

    it "should have the expected keys in the arrays" do
      response = subject.related_offer_show

      expect(response.last.keys).to match_array([:city, :close_date, :company, :description, :immediate_start, :new_offer, :required_experience, :salary, :title])
    end
  end

end