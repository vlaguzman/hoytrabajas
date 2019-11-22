require 'rails_helper'

RSpec.describe "offers/show" do
  let(:job_category) { create(:job_category, description: "sales") }
  let(:job_category_b) { create(:job_category, description: "marketing") }
  let!(:show_offer) { create(:offer, job_categories: [job_category, job_category_b]) }
  let!(:user) { create(:user) }

  context "the offer has all information" do
    it "should render offers show template with all data" do
      assign(:offer, OffersPresenter.new(show_offer, user))

      render

      expect(rendered).to have_tag('div', :with => { "data-react-class" => 'pages/detalle_oferta' })
      expect(rendered).to match(/sales/)
      expect(rendered).to match(/marketing/)
    end
  end
  
end
