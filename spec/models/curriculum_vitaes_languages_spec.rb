require 'rails_helper'

RSpec.describe CurriculumVitaesLanguages, type: :model do

  describe "associations" do
    it  { should belong_to(:curriculum_vitae) }
    it  { should belong_to(:language) }
  end
end
