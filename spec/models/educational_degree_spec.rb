require 'rails_helper'

RSpec.describe EducationalDegree, type: :model do
  it "should validate the presence of description" do
    degree = FactoryBot.build(:educational_degree, description: nil)
    degree.valid?

    expect(degree.errors[:description].size).to eq(1)
  end
end
