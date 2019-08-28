require 'rails_helper'

RSpec.describe User, :type :model do
  user = FactoryBot.build(:user, description: nil)
  user.valid?

  describe "validations" do
    it { is_expected_to validate_presence_of(:description) }
  end

  describe "associations" do
    it { should have_one(:profile) }
  end



end
