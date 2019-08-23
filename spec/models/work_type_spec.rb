require 'rails_helper'

RSpec.describe WorkType, type: :model do
  it "should validate the presence of description" do
    work_types = FactoryBot.build(:work_type, description: nil)
    work_types.valid?

    expect(work_types.errors[:description].size).to eq(1)
  end 
end
