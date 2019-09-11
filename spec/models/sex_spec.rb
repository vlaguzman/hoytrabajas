require 'rails_helper'

RSpec.describe Sex, type: :model do
  it "should validate the presence of description" do
    sex = FactoryBot.build(:sex, description:nil)
    sex.valid?

    expect(sex.errors[:description].size).to eq(1) 
  end
end
