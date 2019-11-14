require 'rails_helper'

RSpec.describe "companies/first_offer/step_fives/show" do
  it "Should render companies/first_offer/step_fives/show template" do
    assign(:offer,  Companies::FirstOffer::StepFivePresenter.new(create(:offer)))

    render

    expect(rendered).to match(/Conozcamos más de tu oferta/)

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_fives/show"})
  end
end
