require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it "should validate the presence of description" do
    vehicle = FactoryBot.build(:vehicle, description: nil)
    vehicle.valid?

    expect(vehicle.errors[:description].size).to eq(1)
  end
end