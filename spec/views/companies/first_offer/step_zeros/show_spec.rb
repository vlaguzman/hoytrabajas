require 'rails_helper'

RSpec.describe "companies/first_offer/step_zeros/show" do
  it "should render step zero template" do
    assign(:company, Companies::FirstOffer::StepZeroPresenter.new(create(:company)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_zeros/show"})

  end
end
