require 'rails_helper'

RSpec.describe JobAid, type: :model do
  it "should validate the presence of description" do
    job_aid = FactoryBot.build(:job_aid, description: nil)
    job_aid.valid?

    expect(job_aid.errors[:description].size).to eq(1)
  end
end
