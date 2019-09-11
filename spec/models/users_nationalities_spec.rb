require 'rails_helper'

RSpec.describe UsersNationalities, type: :model do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:nationality) }
  end
 
end
