require 'rails_helper'

RSpec.describe RecruitmentType, type: :model do
  it "should validate the presence of description" do
    recruitment_type = FactoryBot.build(:recruitment_type, description: nil)
    recruitment_type.valid?

    expect(recruitment_type.errors[:description].size).to eq(1)
  end
end
