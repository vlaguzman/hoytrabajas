require 'rails_helper'

RSpec.describe Limitation, type: :model do

  describe "validation" do
    it { should validate_presence_of(:description) }
  end

  describe "associatons" do
    it { should have_and_belong_to_many(:users) }
  end

end