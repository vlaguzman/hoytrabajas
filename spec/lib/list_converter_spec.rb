require 'rails_helper'

RSpec.describe ListConverter do

  describe "#model_list" do
    context "When model does not have records" do
      it "Should return a empty array" do
        response = subject.model_list(JobCategory)

        expect(response).to be_an_instance_of(Array)
        expect(response).to be_empty
      end
    end

    context "When the model have records" do
      let(:create_expected_job_categories_list) do
        job_category_one = create(:job_category)
        job_category_two = create(:job_category)

        [
          {
            id: job_category_one.id,
            description: job_category_one.description
          },
          {
            id: job_category_two.id,
            description: job_category_two.description
          }
        ]
      end

      it "should return the expected object" do
        expected_list = create_expected_job_categories_list
        response = subject.model_list(JobCategory)

        expect(response).to match_array(expected_list)
      end
    end
  end
end