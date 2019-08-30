require 'rails_helper'

RSpec.describe LanguagesOffers, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:language) }
  end
end