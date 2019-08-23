require 'rails_helper'

RSpec.describe WorkPosition, type: :model do
  it "should validate the presence of description" do
    work_position = FactoryBot.build(:work_position, description: nil)
    work_position.valid?

    expect(work_position.errors[:description].size).to eq(1)
  end
end