require 'rails_helper'

RSpec.describe Profile, :type :model do
  it "should validate the presence of profile" do
    profile = FactoryBot.build(:profile, description: nil)
    profile.valid?

    describe "validations" do
      it { is_expected.to validate_presence_of(:description) }
    end

    describe "associations" do
      it  { should belong_to(:user) }
    end
end
