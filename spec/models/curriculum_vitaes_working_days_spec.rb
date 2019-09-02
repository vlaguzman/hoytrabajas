require 'rails_helper'

RSpec.describe CurriculumVitaesWorkingDays, type: :model do

  describe "associations" do
    it  { should belong_to(:curriculum_vitae) }
    it  { should belong_to(:working_day) }
  end
end