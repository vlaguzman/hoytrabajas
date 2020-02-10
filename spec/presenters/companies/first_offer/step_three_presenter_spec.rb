require "rails_helper"

RSpec.describe Companies::FirstOffer::StepThreePresenter do
  let(:company) { create(:company) }
  let(:offer)   { create(:offer) }
  let(:subject) { described_class.new(offer) }

  describe "#form_information" do
    it "should return a object used by the react component to build it" do
      response = subject.form_information

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :subtitle, :offer_confidential_tooltip, :form, :offer_id]

      expect(response.keys).to eq(expected_keys)
    end
  end
end
