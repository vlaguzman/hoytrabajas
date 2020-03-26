require "rails_helper"
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe AffinityPercentages::ExecuteUpdateWorker, type: :worker do

  describe "Queue" do
    it { is_expected.to be_processed_in :affinitypercentage }
  end

  describe "#perform_async" do

    let!(:sex) { create(:sex, description: "Male")}

    let!(:job_category) { create(:job_category, description: "Job Category One")}

    let!(:offer)            { create(:offer, status: :active) }
    let!(:curriculum_vitae) { create(:curriculum_vitae) }

    let!(:affinity_percentage) { create(:affinity_percentage, offer_id: offer.id, curriculum_vitae_id: curriculum_vitae.id, version: '1.0', affinity_percentage: 90.0) }

    context "when curriculum vitae has been updated" do

      it "Should update AffinityPercentage" do
        expect {
          described_class.perform_async(curriculum_vitae.id)
        }.to change(described_class.jobs, :size).by(1)

        expect(affinity_percentage.job_categories_curriculum_vitae).to be_nil

        curriculum_vitae.update(job_categories: [job_category])

        subject.perform(curriculum_vitae.id)

        affinity_percentage.reload

        expect(affinity_percentage.job_categories_curriculum_vitae).to eq("Job Category One")
      end
    end

    context "when user data has been updated" do
      it "Should update AffinityPercentage" do
        expect(affinity_percentage.job_categories_curriculum_vitae).to be_nil

        curriculum_vitae.user.update(sex_id: sex.id)

        subject.perform(curriculum_vitae.id)

        affinity_percentage.reload

        expect(affinity_percentage.sexes_curriculum_vitae).to eq("Male")
      end
    end
  end
end
