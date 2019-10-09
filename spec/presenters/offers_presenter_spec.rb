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
  end

end