require 'rails_helper'

RSpec.describe OffersTerms, type: :model do
  describe "validations" do
    it { should validate_presence_of(:time) }
  end

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:term) }
  end
end