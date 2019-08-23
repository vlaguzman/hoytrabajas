require 'rails_helper'

RSpec.describe AvailableWorkDay, type: :model do
  it "should validate the presence of description" do
    available_work_day = FactoryBot.build(:available_work_day, description: nil)
    available_work_day.valid?

    expect(available_work_day.errors[:description].size).to eq(1)
  end
end
