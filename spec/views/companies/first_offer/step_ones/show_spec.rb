require 'rails_helper'

RSpec.describe "companies/first_offer/step_ones/show" do
  it "should render step one template" do
    assign(:company, Companies::FirstOffer::StepOnePresenter.new(create(:company)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_ones/show"})
  end
end
