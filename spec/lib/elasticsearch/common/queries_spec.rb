require 'rails_helper'

RSpec.describe Elasticsearch::Common::Queries do

  let(:bogota) { create(:city, description: 'Bogotá') }
  let(:medellin) { create(:city) }

  let(:administration_category) { create(:job_category) }

  let(:subject) { described_class.new }

  describe "request offers to test the builder" do

    let(:rquest_offer) do
      {
        keywords: "mesero de bar",
        city: ['Bogotá', medellin.id],
        job_categories: [administration_category.id]
      }
    end

    describe "Query types" do
      context "When Query type is :match_all" do
        it "should return expected object" do
          response = subject.(query_type: :match_all)

          expected_object = {
            query: {
              match_all: {}
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "When Query type is :multi_match" do
        it "should return expected object" do
          response = subject.(
            query_type: :multi_match,
            request_parameters: { query_string: "aprendiz sena", query_fiels: ["title^2", "description^1"]}
          )

          expected_object = {
            query: {
              multi_match: {fields: ["title^2", "description^1"], query: "aprendiz sena" }
            }
          }

          expect(response).to eq(expected_object)
        end
      end

      context "When Query type is :standard_match, without parameters" do
        it "should return a match all response" do
          response = subject.(query_type: :standard_match)

          expected_object = {
            query: {
              match_all: {}
            }
          }

          expect(response).to eq(expected_object)
        end
      end
    end

    context "When recibe a query object" do
      it "should build the expected query object" do
        response = subject.(request_parameters: rquest_offer)

        expected_object = { query: { bool: {} } }

        expect(response).to eq(expected_object)
      end
    end
  end

  context "When request_parameters is empty" do
    it "should return the expected object" do
      response = subject.()

      expected_object = {
        query: {
          match_all: {}
        }
      }

      expect(response).to eq(expected_object)
    end
  end

  context "When only is nesecery use multi match" do
    let(:query_fiels) { [] }

    it "should return the expected object" do
      response = subject.multi_match_builder(query_string: "", query_fiels: query_fiels)

      expected_object = {:fields=>[], :query=>""}

      expect(response).to eq(expected_object)
    end

  end

  context "When recibe a demo of parameters from home" do

    let(:demo_object) do
      {
        multimatch_field: "aprendiz sena",
        city: [2],
        must_1: "1",
        must_2: "22",
        should_1: ["1"],
        must_not_1: "1",
        job_categories: "uff"
      }
    end

    it "Should return a match all" do

      response = subject.(request_parameters: demo_object)

      expected_object = {
        query: {
          bool: {}
        }
      }

      expect(response).to eq(expected_object)

    end
  end

  context "When initialize a instance" do
    it "Should return a instance of Common queries" do
      response = subject

      expect(response).to be_an_instance_of Elasticsearch::Common::Queries
    end
  end

  describe "constants" do
    it "should return empty arrays" do

      expect(subject.class::MULTIMATCH_PARAM_KEYS).to be_empty
      expect(subject.class::MUST_PARAMS_KEYS).to be_empty
      expect(subject.class::FILTER_PARAMS_KEYS).to be_empty
      expect(subject.class::SHOULD_PARAMS_KEYS).to be_empty
      expect(subject.class::MUST_NOT_PARAMS_KEYS).to be_empty
      expect(subject.class::MULTIMATCH_QUERY_FIELS).to be_empty
      expect(subject.class::COMMON_QUERY_MATCH_ALL).to eq({:match_all => {}})
      expect(subject.class::QUERY_TYPES).to match_array([:match_all, :multi_match, :standard_match])
    end
  end

end