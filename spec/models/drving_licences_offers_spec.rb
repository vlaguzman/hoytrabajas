require 'rails_helper'

RSpec.describe DrivingLicencesOffers, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:driving_licence) }
  end
end