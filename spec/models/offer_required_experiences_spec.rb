require 'rails_helper'

RSpec.describe OfferRequiredExperiences, type: :model do

  describe "validations" do
    it { should validate_presence_of(:duration) }
  end

  describe "associoations" do
    it { should belong_to(:offer) }
    it { should belong_to(:duration_type) }
  end
end
