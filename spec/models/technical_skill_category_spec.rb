RSpec.describe TechnicalSkillCategory, type: :model do
  it "should validate the presence of description" do
    category = FactoryBot.build(:technical_skill_category, description: nil)
    category.valid?

    expect(category.errors[:description].size).to eq(1)
  end
end