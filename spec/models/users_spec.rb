require 'rails_helper'

RSpec.describe User, type: :model do

  describe "associoations" do
    it { should have_and_belong_to_many(:companies) }
  end
end