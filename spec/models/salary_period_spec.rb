require 'rails_helper'

RSpec.describe SalaryPeriod, type: :model do

  describe "validations" do
    it { should validate_presence_of(:description) }
  end

  describe "associoations" do
    #it { should have_and_belong_to_many(:curriculum_vitaes) }
    #it { should have_and_belong_to_many(:offers) }
  end
end
