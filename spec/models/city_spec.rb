require 'rails_helper'

RSpec.describe City, type: :model do
  it "shoild validate the presence of description" do
    city = FactoryBot.build(:city, description: nil)
    city.valid?

    expect(city.errors[:description].size).to eq(1)
  end
end
