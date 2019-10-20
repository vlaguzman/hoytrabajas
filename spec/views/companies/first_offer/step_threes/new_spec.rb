require 'rails_helper'

RSpec.describe "companies/first_offer/step_threes/new" do
  it "Should render companies/first_offer/step_threes/new#edit template" do
    assign(:offer,  Companies::FirstOffer::StepThreePresenter.new(create(:offer)))

    render

    expect(rendered).to match(/Creemos tu primera oferta/)

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_threes/new"})
  end
end
