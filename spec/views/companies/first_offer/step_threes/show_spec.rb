require 'rails_helper'

RSpec.describe "companies/first_offer/step_threes/show" do
  it "Should render companies/first_offer/step_threes/show template" do
    assign(:offer,  Companies::FirstOffer::StepThreePresenter.new(create(:offer)))

    render

    expect(rendered).to match(/Acerca de tu oferta/)

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_threes/show"})
  end
end
