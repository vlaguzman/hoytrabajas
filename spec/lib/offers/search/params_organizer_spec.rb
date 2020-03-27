require 'rails_helper'

RSpec.describe Offers::Search::ParamsOrganizer do

  describe "#call" do
    let(:params) do
      {
        keywords: " aprendiz sena dev",
        key1: "2",
        key2: "2,2",
        key3: "",
        key4: 1.0,
        key5: nil,
        key6: false
      }
    end

    context "when recibe a hash with content" do
      it "should return the expected object" do
        response = subject.(params)

        expected_response = {
          keywords: " aprendiz sena dev",
          key1: [2],
          key2: [2,2],
          key4: [1],
          status: 'active'
        }

        expect(response).to eq(expected_response)
      end
    end

  end

end