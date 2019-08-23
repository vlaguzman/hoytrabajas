require 'rails_helper'

RSpec.describe Handicap, type: :model do
  it "should validate the presence of description" do
    handicap = FactoryBot.build(:handicap, description: nil)
    handicap.valid?

    expect(handicap.errors[:description].size).to eq(1)
  end
end