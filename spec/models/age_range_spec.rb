require 'rails_helper'

RSpec.describe AgeRange, type: :model do
  describe "validations" do
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:to) }
  end

  describe "associoations" do
    it { should belong_to(:offer) }
  end
end