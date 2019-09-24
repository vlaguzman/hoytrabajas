require 'rails_helper'

RSpec.describe TechnicalSkill, type: :model do
  describe "validations" do
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:recommendations) }
    it { should have_and_belong_to_many(:offers) }
    it { should have_and_belong_to_many(:curriculum_vitaes) }
    it { should have_and_belong_to_many(:work_experiences) }
  end
end