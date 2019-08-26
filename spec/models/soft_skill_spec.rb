require 'rails_helper'

RSpec.describe SoftSkill, type: :model do
  it "should validate the presence of description" do
    soft_skill = FactoryBot.build(:soft_skill, description: nil)
    soft_skill.valid?

    expect(soft_skill.errors[:description].size).to eq(1)
  end

  #test shoulda matchers
  xdescribe 'associations' do
    xit { should belong_to(:curriculum_vitae) }
  end
end