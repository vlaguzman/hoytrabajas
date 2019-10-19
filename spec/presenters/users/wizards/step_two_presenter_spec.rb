require "rails_helper"

RSpec.describe Users::Wizards::StepTwoPresenter do
  let(:candidate) { create(:user, :first_time_candidate) }
  let(:subject) { described_class.new(candidate) }

  describe "#form_information" do
    it "should return a object used by the react component to build it" do
      response = subject.form_information(candidate)

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :subtitle, :form]

      expect(response.keys).to eq(expected_keys)
    end
  end

end
