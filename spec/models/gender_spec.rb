require 'rails_helper'

RSpec.describe Gender, type: :model do
  it "should validate the presence of description" do
    gender = FactoryBot.build(:gender, description: nil)
    gender.valid?

    expect(gender.errors[:description].size).to eq(1)
  end
end