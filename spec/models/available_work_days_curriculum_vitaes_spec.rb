require 'rails_helper'

RSpec.describe AvailableWorkDaysCurriculumVitaes, type: :model do

  describe "associations" do
    it  { should belong_to(:curriculum_vitae) }
    it  { should belong_to(:available_work_day) }
  end
end