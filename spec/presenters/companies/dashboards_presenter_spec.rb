require "rails_helper"

RSpec.describe Companies::DashboardsPresenter do
  let(:company) { create(:company) }
  let(:subject) { described_class.new(company) }

  describe "#my_offers" do
    it "should return a object used by the react component to build it" do
      response = subject.my_offers

      expect(response).to be_an_instance_of(Array)

      expect(response).to be_empty
    end

    context "When the company have offers" do
      let!(:company_offers) { create_list(:offer, 3, company: company) }

      it "Should return a array of objects" do
        response = subject.my_offers

        expected_array = Companies::Dashboards::OffersService.(company)

        expect(response).to match_array(expected_array)
      end
    end
  end
end
