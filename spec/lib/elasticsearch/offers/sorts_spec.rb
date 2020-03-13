require 'rails_helper'

RSpec.describe Elasticsearch::Offers::Sorts do

  describe "constants" do
    describe "#SORT_KEYS" do
      it "return a array with expected keys" do

        expected_array = [:created_at]

        expect(subject.class::SORT_KEYS).to be_an_instance_of(Array)
        expect(subject.class::SORT_KEYS).to match_array(expected_array)
      end
    end
  end


  describe "#call" do
    context "when use the default sort keys" do
      it "should return a expected object" do
        response = subject.()

        expected_object = {:sort=>[{:created_at=>{:order=>:desc}}]}

        expect(response).to eq(expected_object)
      end
    end
  end

end