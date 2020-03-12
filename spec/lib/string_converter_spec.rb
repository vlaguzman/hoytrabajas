require 'rails_helper'

RSpec.describe StringConverter do

  describe "#capitalize_text" do
    it "have string all word capitalize" do
      response = subject.capitalize_text("ESto-debe cApitalIZar mI texto s.A.")

      expect(response).to eq("Esto-Debe Capitalizar Mi Texto S.A")
    end
  end

  describe "#replace_chars_to" do
    it "should replace the characters" do
      response = subject.replace_chars_to("ESto-debe-cApitalIZar-mI-texto-s.A.", char_to_replace: "-", new_char: " ")

      expect(response).to eq("ESto debe cApitalIZar mI texto s.A.")
    end
  end

  describe "#split_id_path" do
    it "Should return id for the offer path" do
      response = subject.split_id_path(path: "/offers/65430", position_id: 2)

      expect(response).to eq(65430)
    end

    it "Should return empty string" do
      response = subject.split_id_path(path:"/", position_id: 2)
      response_two = subject.split_id_path(path:"/offer", position_id: 2)
      response_three = subject.split_id_path(path:"/offers/", position_id: 2)

      expect(response).to eq("")
      expect(response_two).to eq("")
      expect(response_three).to eq("")
    end
  end
end
