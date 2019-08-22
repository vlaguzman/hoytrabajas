require 'rails_helper'

RSpec.describe DocumentType, type: :model do
  it "should validate the presence of description" do
    document_type = FactoryBot.build(:document_type, description: nil)
    document_type.valid?

    expect(document_type.errors[:description].size).to_not be_zero
  end
end
