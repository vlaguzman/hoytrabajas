require 'rails_helper'

RSpec.describe Duration, type: :model do
  it "should validate the presence of description" do
    duration = FactoryBot.build(:duration, description: nil)
    duration.valid?
    expect(duration.errors[:description].size).to eq(1)
  end
end
