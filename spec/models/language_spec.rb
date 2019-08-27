require 'rails_helper'

RSpec.describe Language, type: :model do
  it "should validates the presence of description" do
    language = FactoryBot.build(:language, description: nil)
    language.valid?

    expect(language.errors[:description].size).to eq(1)
  end
end 
