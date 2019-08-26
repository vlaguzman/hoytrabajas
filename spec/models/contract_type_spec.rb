require 'rails_helper'

RSpec.describe ContractType, type: :model do
  it "should validate the presence of description" do
    contract_type = FactoryBot.build(:contract_type, description: nil)
    contract_type.valid?

    expect(contract_type.errors[:description].size).to eq(1)
  end
end