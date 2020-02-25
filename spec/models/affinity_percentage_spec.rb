require 'rails_helper'

RSpec.describe AffinityPercentage, type: :model do

  describe "associations" do
    it { should belong_to(:offer) }
    it { should belong_to(:curriculum_vitae) }
  end
end
