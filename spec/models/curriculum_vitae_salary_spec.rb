require 'rails_helper'

RSpec.describe CurriculumVitaeSalary, type: :model do

  describe "validations" do
    it { should validate_presence_of(:from) }
    it { should validate_presence_of(:to) }
  end

  describe "associations" do
    it  { should belong_to(:currency) }
    it  { should belong_to(:salary_period) }
    it  { should belong_to(:curriculum_vitae) }
  end
end