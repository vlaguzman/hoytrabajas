require 'rails_helper'

RSpec.describe CompaniesUsers, type: :model do

  describe "associations" do
    it { should belong_to(:company) }
    it { should belong_to(:user) }
  end
end
