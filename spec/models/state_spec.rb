require 'rails_helper'

RSpec.describe State, type: :model do
  it "should  validate the presence of description" do
    states = FactoryBot.build(:state, description: nil)
    states.valid?

    expect(states.errors[:description].size).to eq(1)
  end
end
