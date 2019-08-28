require 'rails_helper'

RSpec.describe SoftSkill, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "associations" do
    it  { should have_and_belong_to_many(:curriculum_vitaes) }
  end
end