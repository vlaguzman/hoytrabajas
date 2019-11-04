require 'rails_helper'

RSpec.describe "companies/first_offer/step_eights/show" do
  it "should render step eight template" do
    assign(:company, Companies::FirstOffer::StepEightPresenter.new(create(:company)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_elevens/show"})
  end
end
