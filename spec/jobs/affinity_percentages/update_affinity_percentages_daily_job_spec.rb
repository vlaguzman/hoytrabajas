require 'rails_helper'
  include ActiveJob::TestHelper

RSpec.describe AffinityPercentages::UpdateAffinityPercentagesDailyJob, type: :job do

  describe "#perform_later" do

    let(:subject) { described_class }

    it "should be enqueued the job" do
      ActiveJob::Base.queue_adapter = :test

      expect do
        subject.perform_later
      end.to have_enqueued_job
    end
  end

  describe "when the job executed" do

    before { Timecop.freeze(Time.zone.parse("2020-01-01 13:00:00")) }
    after  { Timecop.return }

    let!(:job_category) { create(:job_category)}

    let!(:offer)            { create(:offer, status: :active) }
    let!(:curriculum_vitae) { create(:curriculum_vitae, job_categories: [job_category]) }

    let!(:affinity_percentage) { create(:affinity_percentage, offer_id: offer.id, curriculum_vitae_id: curriculum_vitae.id, version: '1.0', affinity_percentage: 90.0) }

    context "when offer updated at greater than affinity percentage created at" do

      before { Timecop.freeze(Time.zone.parse("2020-01-02 13:00:00")) }
      after  { Timecop.return }

      it "Should update AffinityPercentage" do
        offer.update(job_categories: [job_category], updated_at: Time.zone.now)

        ActiveJob::Base.queue_adapter = :test

        response = subject.perform
        puts "fuck"
        puts response.inspect

        affinity_percentage.reload

        expect(affinity_percentage.updated_at.strftime("%F")).to eq("2020-01-02")
      end
    end

    context "when offer updated at less than affinity percentage created at" do
      it "Should not update AffinityPercentage" do
        ActiveJob::Base.queue_adapter = :test

        subject.perform

        expect(affinity_percentage.updated_at.strftime("%F")).to eq("2020-01-01")
      end
    end
  end
end
