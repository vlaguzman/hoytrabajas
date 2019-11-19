require 'rails_helper'

RSpec.describe "companies/first_offer/step_sixes/show" do
  it "Should render companies/first_offer/step_sixes/show template" do
    assign(:offer,  Companies::FirstOffer::StepSixPresenter.new(create(:offer)))

    render

    expect(rendered).to match(/Conozcamos más de tu oferta/)

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_sixes/show"})
  end
end
