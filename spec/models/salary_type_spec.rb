require 'rails_helper'

RSpec.describe SalaryType, type: :model do
  it "should validate the presence of description" do
    salary_type = FactoryBot.build(:salary_type, description: nil)
    salary_type.valid?

    expect(salary_type.errors[:description].size).to eq(1)
  end
end