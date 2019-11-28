require "rails_helper"

RSpec.describe Home::HomePresenter do
  let(:subject) { described_class.new }

  describe "#data_filter" do
    it "should return a hash with data filter" do
      response = subject.data_filter

      expect(response).to be_an_instance_of(Hash)
      expect(response.keys).to match_array([:fields1, :button1])
    end
  end

  describe "#offers" do
    let(:create_offer) { create(:offer) }

    it "should return a array" do
      create_offer

      response = subject.offers

      expect(response.count).to eq(1)
      expect(response).to be_an_instance_of(Array)
    end
  end

end
