require 'rails_helper'

RSpec.describe SymbolManager do

  describe "#to_constant" do
    it "should return the symbol in class form" do
      expect(subject.to_constant(:offer)).to eq(Offer)
    end

    describe "when symbol is no a valid constant" do
      it "shoul be nil" do
        expect(subject.to_constant(:never_create_this)).to eq(nil)

        expect(subject.to_constant()).to eq(nil)
      end
    end
  end
end