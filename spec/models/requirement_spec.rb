require 'rails_helper'

RSpec.describe Requirement, type: :model do
  describe "validations" do
    it { should validate_presence_of(:description) }
  end
end