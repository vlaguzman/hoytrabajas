require "rails_helper"
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe Elasticsearch::IndexerWorker, type: :worker do

  describe "Queue" do
    it { is_expected.to be_processed_in :elasticsearch }
  end

  describe "#perform_async", vcr: true do

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

    let!(:demo_offer) { create(:offer, id: 1) }

    it "should update the offer index" do

      expect {
        described_class.perform_async('offer', 1, 'index')
      }.to change(described_class.jobs, :size).by(1)


      demo_offer.update(title: "updated title")

      subject.perform('offer', 1, 'index')

      search_result = Offer.search_by id: 1

      expect(search_result.last[:title]).to eq("updated title")

    end
  end
end