RSpec.describe CurriculumVitaesTechnicalSkills, type: :model do

  describe "validations" do
    it { should respond_to(:step_up) }
  end

  describe "associations" do
    it { should belong_to(:job_category) }
    it { should belong_to(:level) }
    it { should belong_to(:curriculum_vitae) }
    it { should belong_to(:technical_skill) }
  end

end