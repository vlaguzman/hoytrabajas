require 'rails_helper'

RSpec.describe "companies/first_offer/step_ones/show" do
  it "Should render companies/first_offer/step_ones/show#edit template" do
    assign(:industries_ids, [create(:nationality), create(:nationality)])
    assign(:company,  Companies::FirstOffer::StepOnePresenter.new(create(:company)))

    render

    expect(rendered).to match(/Empecemos por conocernos/)

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_ones/show"})
  end
end
