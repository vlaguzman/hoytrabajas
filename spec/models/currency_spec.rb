require 'rails_helper'

RSpec.describe Currency, type: :model do

  describe "validations" do
    it  { should validate_presence_of(:description) }
  end
end