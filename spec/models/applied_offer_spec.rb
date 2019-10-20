require 'rails_helper'

RSpec.describe AppliedOffer, type: :model do

  describe "validations" do
    it { should validate_presence_of(:applied_date) }
    it { should validate_presence_of(:offer_id) }
    it { should validate_presence_of(:curriculum_vitae_id) }
    it { should validate_presence_of(:applied_offer_status_id) }
  end

  describe "associoations" do
    it { should belong_to(:offer) }
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:applied_offer_status) }
  end
end
