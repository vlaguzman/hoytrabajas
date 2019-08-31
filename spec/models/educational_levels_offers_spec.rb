require 'rails_helper'

RSpec.describe EducationalLevelsOffers, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:educational_level) }
  end
end