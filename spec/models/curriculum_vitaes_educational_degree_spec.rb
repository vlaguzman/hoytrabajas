require 'rails_helper'

RSpec.describe CurriculumVitaesEducationalDegrees, type: :model do

  describe "associations" do
    it  { should belong_to(:curriculum_vitae) }
    it  { should belong_to(:educational_degree) }
  end
end
