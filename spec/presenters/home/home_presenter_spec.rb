require "rails_helper"

RSpec.describe Home::HomePresenter do

  let(:candidate) { create(:user) }

  let(:subject) { described_class.new candidate }

  describe "#filter_form_attributes" do
    it "should return a hash with data filter" do
      response = subject.filter_form_attributes

      expect(response).to be_an_instance_of(Hash)
      expect(response.keys).to match_array([:fields, :lists])
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

  describe "#categories_list_builder" do
    let!(:offer) { create(:offer) }

    it "should return a array" do
      response = subject.categories_list_builder

      expect(response.count).to eq(1)
      expect(response).to be_an_instance_of(Array)
    end
  end

end
