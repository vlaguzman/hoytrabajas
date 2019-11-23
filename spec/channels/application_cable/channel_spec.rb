require 'rails_helper'

RSpec.describe ApplicationCable do
  describe "Class Channel" do
    it "Should create a Channel object" do
      expect(subject::Channel).to be_present
    end
  end

  describe "Class Connection" do
    it "Should create a Channel object" do
      expect(subject::Connection).to be_present
    end
  end
end