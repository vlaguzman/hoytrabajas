require 'rails_helper'

RSpec.describe Users::Wizards::UserErrorsService do
  let(:incomplete_candidate) { create(:user, :first_time_candidate) }

  let(:update_params) do
    {
      nationality_ids: [''],
      born_city_id: nil,
      document_type_id: nil,
      residence_city_id: nil
    }
  end

  describe "#validate" do

    let(:subject) { described_class.new(incomplete_candidate, update_params) }

    it "should add error to user model" do
      response = subject.validate

      expected_errors = {
        :nationalities=>[{:error=>:blank}],
        :document_type_id=>[{:error=>:blank}],
        :born_city_id=>[{:error=>:blank}],
        :residence_city_id=>[{:error=>:blank}]
      }


      expect(response).to be_an_instance_of User
      expect(response.errors).to be_present
      expect(response.errors.details).to eq(expected_errors)
    end
  end

  describe "#call" do
    it "should return a model with errors" do
      response = described_class.(incomplete_candidate, update_params: update_params)

      expected_errors = {
        :nationalities=>[{:error=>:blank}],
        :document_type_id=>[{:error=>:blank}],
        :born_city_id=>[{:error=>:blank}],
        :residence_city_id=>[{:error=>:blank}]
      }


      expect(response).to be_an_instance_of User
      expect(response.errors).to be_present
      expect(response.errors.details).to eq(expected_errors)
    end
  end
end