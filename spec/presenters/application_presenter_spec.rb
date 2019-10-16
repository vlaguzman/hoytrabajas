require "rails_helper"

RSpec.describe ApplicationPresenter do
  let(:offer) { create(:offer) }
  let(:subject) { described_class.new(offer) }

  let!(:job_categories_list) { create_list(:job_category, 5) }

  describe "#model_list" do
    it "should return a array" do
      response = subject.model_list(JobCategory)

      expect(response).to be_an_instance_of(Array)
    end
  end

  describe "#rails_routes" do
    it "should return a return specific path" do
      response = subject.rails_routes.root_path

      expect(response).to eq("/")
    end
  end

end