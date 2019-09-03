require 'rails_helper'

RSpec.describe UsersLimitations, type: :model do

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:limitation) }
  end

end
