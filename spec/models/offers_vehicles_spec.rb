require 'rails_helper'

RSpec.describe OffersVehicles, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:vehicle) }
  end
end
