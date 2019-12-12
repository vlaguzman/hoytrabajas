require "rails_helper"

RSpec.describe Users::Wizards::StepElevenPresenter do

  let!(:curriculum) { create(:curriculum_vitae, :empty, user: create(:user, :first_time_candidate)) }
  let(:candidate) { curriculum.user }
  let(:subject) { described_class.new(candidate) }

  describe '#form_information' do
    it 'should return a object used by the react component to build it' do
      response = subject.form_information

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :subtitle, :form]

      expect(response.keys).to eq(expected_keys)
    end
  end
end