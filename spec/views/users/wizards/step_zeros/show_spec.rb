require 'rails_helper'

RSpec.describe "users/wizards/step_zeros/show.haml" do
  it "displays the welcome message for a new user" do
    assign(:user, Users::Wizards::StepZeroPresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_zeros/show"})
  end
end
