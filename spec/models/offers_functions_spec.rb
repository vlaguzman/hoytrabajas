require 'rails_helper'

RSpec.describe FunctionsOffers, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:function) }
  end
end