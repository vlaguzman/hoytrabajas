require 'rails_helper'

RSpec.describe Elasticsearch::SearchService do

  before do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['TEST_ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!
  end

  after do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!
  end

  describe "#call" do

    let(:bogota) { create(:city) }
    let(:other_city) { create(:city) }

    context "when recibe the sort class" do
      let(:request_parameters) do
        { city: bogota.id }
      end

      let!(:first_offer)  { create(:offer, city: bogota, created_at: Date.new(2020, 1, 1)) }
      let!(:second_offer) { create(:offer, city: bogota, created_at: Date.new(2020, 2, 4)) }
      let!(:third_offer)  { create(:offer, city: bogota, created_at: Date.new(2020, 5, 14)) }
      let!(:fourth_offer)  { create(:offer, city: bogota, created_at: Date.new(2020, 5, 21)) }
      let!(:last_offer)   { create(:offer, city: bogota, created_at: Date.new(2020, 7, 22)) }


      it "should return 5 results" do
        Offer.import

        sleep(1)

        response = subject.(
          Offer,
          Elasticsearch::Offers::Queries,
          sort_class: Elasticsearch::Offers::Sorts,
          request_parameters: request_parameters
        )

        expected_array = [
          last_offer[:created_at],
          fourth_offer[:created_at],
          third_offer[:created_at],
          second_offer[:created_at],
          first_offer[:created_at],
        ]

        expect(response).to be_a Array
        expect(response.pluck(:created_at)).to match_array(expected_array)
      end
    end

    describe "recibe parametes and options without sort class" do

      let(:developer_category) { create(:job_category) }

      let!(:only_bogota_offers) { create_list(:offer, 2, city: bogota) }
      let!(:bogota_and_dev_offers) { create_list(:offer, 3, city: bogota, job_categories: [developer_category] ) }
      let!(:dev_offers) { create_list(:offer, 1, city: other_city, job_categories: [developer_category] ) }


      context "when search only by city" do

        let(:request_parameters) do
          { city: bogota.id }
        end

        it "should return 5 results" do
          Offer.import

          sleep(0.5)

          response = subject.(Offer, Elasticsearch::Offers::Queries, request_parameters: request_parameters)

          expect(response).to be_a Array
          expect(response.size).to eq(5)
        end
      end

      context "when search by city and job category" do

        let(:request_parameters) do
          {
            city: bogota.id,
            job_categories: developer_category.id
          }
        end

        it "should return 3 results" do
          Offer.import

          sleep(0.5)

          response = subject.(Offer, Elasticsearch::Offers::Queries, request_parameters: request_parameters)

          expect(response).to be_a Array
          expect(response.size).to eq(3)
        end
      end

      context "when search job category" do

        let(:request_parameters) do
          {
            job_categories: developer_category.id
          }
        end

        it "should return 4 results" do
          Offer.import

          sleep(0.5)

          response = subject.(Offer, Elasticsearch::Offers::Queries, request_parameters: request_parameters)

          expect(response).to be_a Array
          expect(response.size).to eq(4)
        end
      end
    end
  end

end