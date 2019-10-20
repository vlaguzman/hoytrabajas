require 'rails_helper'

RSpec.describe "offers/show" do
  let(:show_offer) { create(:offer) }
  let(:user) { create(:user) }

  let!(:age_range) { create(:age_range, offer: show_offer) }
  let!(:offer_salary) { create(:offer_salary, offer: show_offer) }

  it "should render offers show template" do
    assign(:offer, OffersPresenter.new(show_offer, user))
    render

    expect(rendered).to have_tag('div', :with => { "data-react-class" => 'pages/detalle_oferta' })
  end

end
