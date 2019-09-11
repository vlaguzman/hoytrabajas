require 'rails_helper'

RSpec.describe JobCategory, type: :model do
  context "validations" do
    it { should validate_presence_of(:description) }
  end

  context "associations" do
    it { should have_and_belong_to_many(:curriculum_vitaes) }
  end
end
