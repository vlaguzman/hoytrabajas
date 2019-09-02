require 'rails_helper'

RSpec.describe OffersSoftSkills, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:soft_skill) }
  end
end