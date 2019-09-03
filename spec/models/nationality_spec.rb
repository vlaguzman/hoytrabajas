require 'rails_helper'

RSpec.describe Nationality, type: :model do

  describe "validations" do
    it { should validate_presence_of(:description) }
  end

  describe "validations" do
    it { should have_and_belong_to_many(:users) }
  end
end
