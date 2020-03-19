require 'rails_helper'

RSpec.describe "users/dashboards/show" do
  it "Should render users#show template" do
    assign(:user, UsersPresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "pages/dashboards/index"})
  end
end