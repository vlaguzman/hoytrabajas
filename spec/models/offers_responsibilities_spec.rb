require 'rails_helper'

RSpec.describe OffersResponsibilities, type: :model do

  describe "associations" do
    it  { should belong_to(:offer) }
    it  { should belong_to(:responsibility) }
  end
end
