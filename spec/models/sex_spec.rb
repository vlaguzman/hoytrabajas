require 'rails_helper'

RSpec.describe Sex, type: :model do
  it { should validate_presence_of :description }
end
