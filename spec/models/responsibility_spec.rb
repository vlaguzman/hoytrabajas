require 'rails_helper'

RSpec.describe Responsibility, type: :model do

  describe "validations" do
    it { should validate_presence_of(:description) }
  end
end