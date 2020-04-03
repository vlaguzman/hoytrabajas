require 'rails_helper'

RSpec.describe AgeRangeListsOffers, type: :model do

  describe "associoations" do
    it { should belong_to(:offer) }
    it { should belong_to(:age_range_list) }
  end
end
