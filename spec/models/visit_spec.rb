require 'rails_helper'

RSpec.describe Visit, type: :model do

  describe "associoations" do
    it { should belong_to(:curriculum_vitae) }
  end
end