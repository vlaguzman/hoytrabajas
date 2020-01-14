require 'rails_helper'

RSpec.describe AddModelErrorsService do

  let(:new_candidate) { create(:user, :first_time_candidate) }

  let(:collection_params_list) do
    [
      {
        key: :nationality_ids,
        collection_name: :nationalities,
        error_key: :blank
      }
    ]
  end

  let(:single_params_list) do
    [
      {
        key: :residence_city_id,
        error_key: :blank
      },
      {
        key: :document_type_id,
        error_key: :blank
      }
    ]
  end

  describe "When a instance is stated" do

    let(:update_params) do
      {
        residence_city_id: nil,
        document_type_id: nil,
        nationality_ids: ['']
      }
    end

    let(:subject) { described_class.new(new_candidate, update_params) }

    it "should return a model with errors" do
      response = subject.validate

      expected_errors = {}

      expect(response).to be_an_instance_of(User)
      expect(response.errors.details).to eq(expected_errors)
    end
  end

  describe "#validate_single_attributes" do
    context "When a list of validate params is present" do

      let(:update_params) do
        {
          residence_city_id: nil,
          document_type_id: nil
        }
      end

      let(:subject) { described_class.new(new_candidate, update_params) }

      it "should add the errors to the model" do
        response = subject.validate_single_attributes

        expected_errors = {
          :document_type_id => [{:error=>:blank}],
          :residence_city_id => [{:error=>:blank}]
        }

        expect(response).to be_an_instance_of(Array)
      end
    end
  end

  describe "#validate_collection_attributes" do
    context "When a list of validate params is present" do

      let(:update_params) do
        {
          nationality_ids: ['']
        }
      end

      let(:subject) { described_class.new(new_candidate, update_params) }


      it "should add the errors to the model" do
        response = subject.validate_collection_attributes

        expected_errors = {
          :nationalities => [{:error=>:blank}]
        }

        expect(response).to be_an_instance_of(Array)
      end
    end
  end

  describe "#validate_single_element_presence" do
    context "when the model is a user instance" do

      let(:update_params) do
        {
          residence_city_id: nil
        }
      end

      let(:subject) { described_class.new(new_candidate, update_params) }

      it "should add error to model" do
        response = subject.validate_single_element_presence(
          validate_param: :residence_city_id,
          error_key: :blank
        )

        expect(response).to match_array(["Debes selecionar lugar de residencia"])
      end
    end

  end

  describe "#validate_collection_presence" do
    context "when the model is a user instance" do

      let(:update_params) do
        {
          nationality_ids: ['']
        }
      end

      let(:subject) { described_class.new(new_candidate, update_params) }

      it "should add error to model" do

        response = subject.validate_collection_presence(
          collection_name: :nationalities,
          validate_param: :nationality_ids,
          error_key: :blank
        )

        expect(response).to match_array(["Debes selecionar por lo menos una nacionalidad"])
      end
    end

  end
end