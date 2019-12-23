require "rails_helper"

RSpec.describe BaseForms::FindOrCreateRecordService do
  describe "#call" do
    let!(:stuffed_job_categories) do
      [
        create(:job_category, description: 'Health and Care'),
        create(:job_category, description: 'Construction')
      ]
    end

    context "When dont recibe params" do
      it "Should return false" do
        response = subject.()

        expect(response).to be_falsy
      end
    end

    context "When recibe a new entry" do
      it "should return the record element" do
        expect(JobCategory.count).to eq(2)

        response = subject.(klass: JobCategory, search_or_cration_params: {description: 'Home and Stuff'} )

        expect(JobCategory.count).to eq(3)
        expect(response).to be_an_instance_of(JobCategory)
        expect(response.description).to eq('Home and Stuff')

      end
    end

    context "When recibe a new entry" do
      it "should create and return the record element" do
        expect(JobCategory.count).to eq(2)

        response = subject.(klass: JobCategory, search_or_cration_params: {description: 'Health and Care'} )

        expect(JobCategory.count).to eq(2)
        expect(response).to be_an_instance_of(JobCategory)
        expect(response.description).to eq('Health and Care')
      end
    end
  end
end