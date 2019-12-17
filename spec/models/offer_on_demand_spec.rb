require 'rails_helper'

RSpec.describe OfferOnDemand, type: :model do

  describe "validations" do
    it { should validate_presence_of(:status) }
  end

  describe "associations" do
    it { should belong_to(:offer) }
  end
end
