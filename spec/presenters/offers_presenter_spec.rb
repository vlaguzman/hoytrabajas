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

  describe "#index_details" do
    it { should respond_to(:index_details) }

    it "should return a array with the required info to show template" do
      response = subject.related_offer_show

      expect(response).to be_an_instance_of(Array)
    end

    it "should have the expected keys in the arrays" do
      response = subject.related_offer_show

      expect(response.last.keys).to match_array([:city, :close_date, :company, :description, :immediate_start, :new_offer, :required_experience, :salary, :title])
    end
  end

end