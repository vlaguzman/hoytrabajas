require 'rails_helper'

RSpec.describe EducationalDegree, type: :model do

  describe "validations" do
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:user) }
  end

  describe "associoations" do
    it { should have_and_belong_to_many(:curriculum_vitaes) }
    it { should have_and_belong_to_many(:user) }
  end

end
