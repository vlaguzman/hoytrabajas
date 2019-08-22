require 'rails_helper'

RSpec.describe Nationality, type: :model do
  it "should validate the presence of description" do
    nationality = FactoryBot.build(:nationality, description: nil)  
    nationality.valid?
    expect(nationality.errors[:description].size).to eq(1)
  end
end
