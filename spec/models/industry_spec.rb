require 'rails_helper'

RSpec.describe Industry, type: :model do
  it "validate the presence of description" do
    industry = FactoryBot.build(:industry, description: nil) 
    industry.valid?

    expect(industry.errors[:description].size).to eq(1)
  end
end
