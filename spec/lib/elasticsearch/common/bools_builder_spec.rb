require 'rails_helper'

RSpec.describe Elasticsearch::Common::BoolBuilders do

  let(:bogota) { create(:city) }
  let(:medellin) { create(:city) }

  let(:tech_category) { create(:job_category) }

  let(:group_filters) do
    {
      city: [bogota.id, medellin.id],
      job_categories: [tech_category.id]
    }
  end

  let(:simple_filters) do
    {
      status: "active",
      other_filter: "the value"
    }
  end

  describe "constants" do
    context "#COMMON_BOOL_CLAUSES" do
      it "should return expected object" do
        response = subject::COMMON_BOOL_CLAUSES

        expect(response).to match_array([:must, :filter, :should, :must_not])

      end
    end
  end

  describe "#call" do
    describe "tested with all clauses" do
      let(:simple_expected_object) { [{:term=>{:status=>"active"}}, {:term=>{:other_filter=>"the value"}}] }

      context "when used must" do
        it "should return expected object" do
          expect(subject.(parameters: simple_filters, clause: :must)).to eq(simple_expected_object)
        end
      end

      context "when used filter" do
        it "should return expected object" do
          expected_object = [{
            nested:{
              path: "city",
              query: {
                bool: {
                  should: [
                    { match: { "city.id" => bogota.id } },
                    { match: { "city.id" => medellin.id } }
                  ]
                }
              }
            }
          },
          {
            nested:{
              path: "job_categories",
              query: {
                bool: {
                  should: [
                    { match: { "job_categories.id" => tech_category.id } }
                  ]
                }
              }
            }
          }]

          expect(subject.(parameters: group_filters, clause: :filter)).to eq(expected_object)
        end
      end

      context "when used should" do
        it "should return expected object" do
          expect(subject.(parameters: simple_filters, clause: :should)).to eq(simple_expected_object)
        end
      end

      context "when used must_not" do
        it "should return expected object" do
          expect(subject.(parameters: simple_filters, clause: :must_not)).to eq(simple_expected_object)
        end
      end
    end
  end

  describe "#simple_bool_builder" do
    context "When recibe filters" do
      it "Should return the expected object" do
        response = subject.simple_bool_builder(parameters: simple_filters)

        expected_respose = [
            { term: { status: "active" } },
            { term: { other_filter: "the value" } }
          ]

        expect(response).to eq(expected_respose)
      end
    end

    context "When recibe filtes and a main clause" do
      it "Should return the expected object" do
        response = subject.simple_bool_builder(parameters: simple_filters)

        expected_respose = [
            { term: { status: "active" } },
            { term: { other_filter: "the value" } }
          ]

        expect(response).to eq(expected_respose)
      end
    end
  end

  describe "#group_filters_builder" do
    context "When recibe the hash with filter keys" do
      it "Should build the expected object" do
        response = subject.group_filters_iterator(group_filters: group_filters)

        expected_object = [{
          nested:{
            path: "city",
            query: {
              bool: {
                should: [
                  { match: { "city.id" => bogota.id } },
                  { match: { "city.id" => medellin.id } }
                ]
              }
            }
          }
        },
        {
          nested:{
            path: "job_categories",
            query: {
              bool: {
                should: [
                  { match: { "job_categories.id" => tech_category.id } }
                ]
              }
            }
          }
        }]

        expect(response).to eq(expected_object)
      end
    end
  end

end