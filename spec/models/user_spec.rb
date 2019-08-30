require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryBot.build(:user)
  user.valid?

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_presence_of(:sign_in_count) }
    it { is_expected.to validate_presence_of(:confirmed_at) }
    
  end

  describe "associations" do
    it { should have_one(:profile) }
  end



end
