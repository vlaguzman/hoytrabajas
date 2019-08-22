require 'rails_helper'

RSpec.describe JobCategory, type: :model do
  it "should validate the presence of description" do
    job_categories= FactoryBot.build(:job_category, description: nil) 
    job_categories.valid?
    expect(job_categories.errors[:description].size).to eq(1)
  end
end
