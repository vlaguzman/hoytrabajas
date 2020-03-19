require "rails_helper"
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe Elasticsearch::IndexerWorker, type: :worker do

  describe "Queue" do
    it { is_expected.to be_processed_in :elasticsearch }
  end

  describe "#perform_async", vcr: true do

    let(:demo_offer) { create(offer) }

    it "should enque" do
      expect {
        described_class.perform_async('offer', 1, 'index')
      }.to change(described_class.jobs, :size).by(1)
    end
  end
end