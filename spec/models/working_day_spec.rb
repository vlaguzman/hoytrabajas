require 'rails_helper'

RSpec.describe WorkingDay, type: :model do

  describe "validations" do
    it { should validate_presence_of(:description) }
  end

  describe "assocciations" do
    it { should have_and_belong_to_many(:offers) }
  end

end
