require "rails_helper"
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe Elasticsearch::IndexerService do

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


  describe "#call", vcr: true do
    let(:expeted_title) {'Im the new title the old sucks' }

    context "When offer is not indexed" do

      it "should return a indexed elasticsearch query" do

        demo_offer = create(:offer, id: 1, title: expeted_title)

        subject.(:offer, 1, operation: 'index')

        search_result = Offer.search_by(id: 1)

        expect(search_result.last[:title]).to eq(expeted_title)

      end
    end

    context "When offer is updated" do
      it "should return updated elasticsearch query" do
        demo_offer = create(:offer, id: 2)

        Offer.import

        demo_offer.update(title: expeted_title)

        subject.(:offer, 2, operation: 'index')

        search_result = Offer.search_by(id: 2)

        expect(search_result.last[:title]).to eq(expeted_title)
      end
    end

    context "when offer is removed" do
      it "should return" do
        demo_offer = create(:offer, id: 3)

        Offer.import

        subject.(:offer, 3, operation: 'delete')

        search_result = Offer.search_by(id: 3)

        expect(search_result).to be_empty
      end
    end
  end
end