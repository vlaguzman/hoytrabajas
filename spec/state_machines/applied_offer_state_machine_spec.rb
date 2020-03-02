require 'rails_helper'

RSpec.describe AppliedOfferStateMachine do
  describe "#states" do
    it "Should be five states" do
      states = described_class.states
      expect(states.count).to eq(4)
      expect(states).to match_array([
        "unseen",
        "seen",
        "interested",
        "not_interested"
      ])
    end
  end

  describe "#successors" do
    describe "Pending transitions" do
      it "Should be to 'failure or success'" do
        trasitions = described_class.successors
        expect(trasitions["unseen"]).to eq(["seen"])
        expect(trasitions["seen"]).to eq(["interested", "not_interested"])
        expect(trasitions["interested"]).to eq(["not_interested"])
        expect(trasitions["not_interested"]).to eq(["interested"])
      end
    end
  end
end