require 'rails_helper'

RSpec.describe AvailableWorkDaysOffers, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:available_work_day) }
  end
end