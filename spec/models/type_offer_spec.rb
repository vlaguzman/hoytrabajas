require 'rails_helper'

RSpec.describe TypeOffer, type: :model do 
  it "should validate the presence of description" do
    type_offer = FactoryBot.build(:type_offer, description: nil)
    type_offer.valid?

    expect(type_offer.errors[:description].size).to eq(1)

  end
end
