require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:recommendation) }
  end

  describe "associations" do
    it { should belong_to(:curriculum_vitae) }
  end
end