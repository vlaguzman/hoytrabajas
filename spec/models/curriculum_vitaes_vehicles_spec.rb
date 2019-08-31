require 'rails_helper'

RSpec.describe CurriculumVitaesVehicles, type: :model do

  describe "associations" do
    it  { should belong_to(:curriculum_vitae) }
    it  { should belong_to(:vehicle) }
  end
end
