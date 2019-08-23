require 'rails_helper'

RSpec.describe WorkingDay, type: :model do
  it "should validation the presence of description" do
    working_day = FactoryBot.build(:woking_day, description: nil)
    working_day.valid?
 
    expect(working_day.errors[:description].size).to eq(1)
  end
end
