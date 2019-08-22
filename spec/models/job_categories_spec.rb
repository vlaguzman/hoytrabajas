require 'rails_helper'

RSpec.describe JobCategory, type: :model do
  it "should validate the presence of description" do
    job_categories= JobCategory.new
    job_categories.valid?
    expect(job_categories.errors[:description].size).to eq(1)
  end
end
