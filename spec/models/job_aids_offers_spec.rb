require 'rails_helper'

RSpec.describe JobAidsOffers, type: :model do

  describe "associations" do
    it  { should belong_to(:job_aid) }
    it  { should belong_to(:offer) }
  end
end