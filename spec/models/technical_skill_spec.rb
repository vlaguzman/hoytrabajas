require 'rails_helper'

RSpec.describe TechnicalSkill, type: :model do
  it "should validate the presence of description" do
    technical_skill = FactoryBot.build(:technical_skill, description: nil)
    technical_skill.valid?

    expect(technical_skill.errors[:description].size).to eq(1)
  end
end