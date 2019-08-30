require 'rails_helper'

RSpec.describe OffersWorkingDays, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:working_day) }
  end
end