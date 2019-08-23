require 'rails_helper'

RSpec.describe DrivingLicence, type: :model do
  it "should validate the presence of description" do
    driving_licence = FactoryBot.build(:driving_licence, description: nil)
    driving_licence.valid?

    expect(driving_licence.errors[:description].size).to eq(1)
  end
end