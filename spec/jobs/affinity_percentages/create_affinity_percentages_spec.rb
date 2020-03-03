require 'rails_helper'
  include ActiveJob::TestHelper

RSpec.describe AffinityPercentages::CreateAffinityPercentages, type: :job do

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

    let!(:offer_1) { create(:offer, status: :active, created_at: Time.now - 1.days) }
    let!(:offer_2) { create(:offer, status: :active, created_at: Time.now - 1.days) }

    let!(:curriculum_vitae_1) { create(:curriculum_vitae, created_at: Time.now - 1.days) }
    let!(:curriculum_vitae_2) { create(:curriculum_vitae, created_at: Time.now - 1.days) }

    it "Should create AffinityPercentage of offers and curriculum vitaes" do
      ActiveJob::Base.queue_adapter = :test

      expect(AffinityPercentage.all.count).to eq(0)

      subject.perform

      expect(AffinityPercentage.all.count).to eq(4)

      affinity_percentages = [
        AffinityPercentage.find_by(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id),
        AffinityPercentage.find_by(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_2.id),
        AffinityPercentage.find_by(offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_1.id),
        AffinityPercentage.find_by(offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_2.id)
      ]

      affinity_percentages.map do |affinity_percentage|
        expect(affinity_percentage).to_not be_nil
      end
    end
  end
end
