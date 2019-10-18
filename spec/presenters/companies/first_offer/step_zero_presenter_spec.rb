require "rails_helper"

RSpec.describe Companies::FirstOffer::StepZeroPresenter do
  let(:company) { create(:company) }
  let(:subject) { described_class.new(company) }

  describe "#traslation" do
    it "should return a object used by the react component to build it" do
      response = subject.component_translations

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :description, :button_action]

      expect(response.keys).to eq(expected_keys)
    end
  end
end
