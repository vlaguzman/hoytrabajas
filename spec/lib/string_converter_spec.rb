require 'rails_helper'

RSpec.describe StringConverter do

  describe "#capitalize_text" do
    it "have string all word capitalize" do
      response = subject.capitalize_text("ESto debe cApitalIZar mI texto s.A.")

      expect(response).to eq("Esto Debe Capitalizar Mi Texto S.A.")
    end
  end
end
