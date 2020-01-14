require 'rails_helper'

RSpec.describe Users::Wizards::CurriculumVitaeErrorsService do
  let(:incomplete_cv) { create(:curriculum_vitae, :empty) }

  let(:update_params) do
    {
      job_category_ids: ['']
    }
  end

  describe "#call" do
    it "should add error to curriculum vitae model" do

      response = described_class.(incomplete_cv, update_params: update_params)

      expected_errors = {
        :job_categories=>[{:error=>:blank}]
      }

      expect(response.errors).to be_present
      expect(response.errors.details).to eq(expected_errors)
    end
  end
end