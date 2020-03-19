require 'rails_helper'

RSpec.describe "companies/dashboards/show" do

  let(:hoy_camellas) { create(:company) }

  it "should render companies/dashboards/show template" do
    assign(:company, Companies::DashboardsPresenter.new(hoy_camellas))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/dashboards/enterprises"})
  end
end
