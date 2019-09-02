require 'rails_helper'

RSpec.describe OffersWorkPositions, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:positon) }
  end
end