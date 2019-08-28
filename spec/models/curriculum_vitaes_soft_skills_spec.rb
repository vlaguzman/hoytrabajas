require 'rails_helper'

RSpec.describe CurriculumVitaesSoftSkills, type: :model do

  describe "associations" do
    it  { should belong_to(:curriculum_vitae) }
    it  { should belong_to(:soft_skill) }
  end
end
