require "rails_helper"

RSpec.describe Users::Wizards::StepEightPresenter do
  let(:developer) { create(:work_position, description: "Developer")}
  let(:head_hunter) { create(:work_position, description: "Head Hunter") }
  let(:curriculum) { create(:curriculum_vitae, user: create(:user, :first_time_candidate)) }
  let!(:expected_work_experiences) {
    create(:work_experience, curriculum_vitae: curriculum, company_name: "HoyCamellas", work_position: developer)
  }

  let(:subject) { described_class.new(expected_work_experiences) }

  describe '#show_form_information' do
    it 'should return a object used by the react component to build it' do
      response = subject.show_form_information

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [:title, :form]

      expect(response.keys).to eq(expected_keys)
    end
  end

end