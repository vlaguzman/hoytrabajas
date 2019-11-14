require 'rails_helper'

RSpec.describe "users/profiles/show" do
  it "Should render users/profiles#show template" do
    assign(:user, create(:user))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/profile"})
  end
end