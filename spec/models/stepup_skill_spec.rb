RSpec.describe StepUpSkill, type: :model do

  describe "associations" do
    it  { should belong_to(:curriculum_vitae) }
    it  { should belong_to(:technical_skill) }
  end
end