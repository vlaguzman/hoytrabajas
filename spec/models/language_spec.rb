require 'rails_helper'

RSpec.describe Language, type: :model do

  describe "validation" do
    it { should validate_presence_of(:description) }
  end

  describe "associations" do
    it { should have_and_belong_to_many(:offers) }
  end
end
