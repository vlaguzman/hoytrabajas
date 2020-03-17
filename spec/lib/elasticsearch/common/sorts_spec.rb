require 'rails_helper'

RSpec.describe Elasticsearch::Common::Sorts do

  describe "constants" do
    describe "#SORT_KEYS" do
      it "return a empty array" do
        expect(subject.class::SORT_KEYS).to be_an_instance_of(Array)
        expect(subject.class::SORT_KEYS).to be_empty
      end
    end
  end

  describe "#call" do
    context "when recibe the params" do

      let(:sort_parameters) do
        [
          :status
        ]
      end

      it "should return the sort array object" do
        response = subject.(sort_parameters: sort_parameters)

        expected_object = { sort: [
          status: { order: :desc }
        ] }

        expect(response).to eq(expected_object)
      end
    end
  end

  describe "#sort_field_detector" do
    context "When recive sort parameters" do
      it "should return expected object" do
        response = subject.sort_field_detector(sort_parameters: [:status, :date, :color, {key: :flavor, mode: :max}])

        expected_array = [
          {:status=>{:order=>:desc}},
          {:date=>{:order=>:desc}},
          {:color=>{:order=>:desc}},
          {:flavor=>{:order=>:desc, :mode=>:max}}
        ]

        expect(response).to eq(expected_array)

      end

    end
  end

  describe "#sort_field_builder" do
    it "should return expected object" do
      expected_object = {
        status: {
          order: :desc
        }
      }

      expect(subject.sort_field_builder(key: :status)).to eq(expected_object)
    end

    describe "when order and mode is passed" do
      it "should return expected object" do
        expected_object = {
          status: {
            order: :asc,
            mode: :max
          }
        }

        expect(subject.sort_field_builder(key: :status, order: :asc, mode: :max)).to eq(expected_object)
      end
    end
  end

end