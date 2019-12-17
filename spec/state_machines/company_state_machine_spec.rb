require 'rails_helper'

RSpec.describe CompanyStateMachine do
  describe "#states" do
    it "Should be two states" do
      states = described_class.states

      expect(states.count).to eq(2)
      expect(states).to match_array([
        "premium",
        "no_premium"
      ])
    end
  end

  describe "#successors" do
    describe "All transitions" do
      it "Should be to 'failure or success'" do
        transitions = described_class.successors

        expect(transitions["premium"]).to eq(["no_premium"])
        expect(transitions["no_premium"]).to eq(["premium"])
      end
    end
  end
end
