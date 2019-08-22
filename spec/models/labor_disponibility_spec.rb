require 'rails_helper'

RSpec.describe LaborDisponibility, type: :model do
  it "should validate the presence of description" do
    labor_disponibility = FactoryBot.build(:labor_disponibility, description: nil)
    labor_disponibility.valid?

    expect(labor_disponibility.errors[:description].size).to_not be_zero
  end
end
