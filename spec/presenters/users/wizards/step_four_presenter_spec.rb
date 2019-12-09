require "rails_helper"

RSpec.describe Users::Wizards::StepFourPresenter do
  let(:candidate) { create(:user) }
  let(:subject) { described_class.new(candidate) }

  describe '#show_form_information' do
    it 'should return a object used by the react component to build it' do
      response = subject.show_form_information

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :subtitle, :form]

      expect(response.keys).to eq(expected_keys)
    end
  end

end
