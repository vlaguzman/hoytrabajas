require 'rails_helper'

RSpec.describe OfferType, type: :model do
  it "should validate the presence of description" do
    offer_type = FactoryBot.build(:offer_type, description: nil)
    offer_type.valid?

    expect(offer_type.errors[:description].size).to eq(1)
  end

  context "associations" do
    it { should have_and_belong_to_many(:curriculum_vitaes) }
  end
end
